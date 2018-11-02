from notif import *
import time
import datetime
import pymysql.cursors
import time
import datetime
import main_facerec
import main_facerec2
import main_facerec3
import os
from bot_notif import *
from email_notif import *
from notify_run import Notify
import cv2
import smtplib
import argparse
import sys

def main(args):
    mode = args.mode
    if(mode == "notif"):
        notif()

def notif():
    while True:
        try:
            connection = pymysql.connect(host='localhost',
                                         user='root',
                                         password='root',
                                         db='face_recognition',
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            with connection.cursor() as cursor:
                # Create a new record
                ts = time.time()
                timestamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')
                ceksql= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE DATE(`waktu_masuk`) = DATE(CURDATE()) AND aktif_notif='1' LIMIT 1"
                cursor.execute(ceksql)
                checking = cursor.fetchone()
                print(checking.get('ceknama'))
                if checking.get('ceknama')>=1:
                    ceksql= "SELECT nama_pegawai FROM `face_absensi` WHERE DATE(`waktu_masuk`) = DATE(CURDATE()) AND aktif_notif='1' LIMIT 1"
                    cursor.execute(ceksql)
                    checking = cursor.fetchone()
                    insertdata=checking.get('nama_pegawai')
                    if timestamp>'06:00:00' and timestamp<'08:30:00':
                        status="Tepat Waktu"
                        notif=notif_datang(insertdata,status)
                    elif timestamp>'08:30:00' and timestamp<'17:30:00':
                        status="Terlambat"
                        notif=notif_datang(insertdata,status)
                    elif timestamp>'17:30:00' and timestamp<'23:59:00':
                        notif=balik_notif(insertdata)
            # connection is not autocommit by default. So you must commit to save
            # your changes.
            connection.commit()

        except:
            continue

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--mode", type=str, help="Run notif", default="notif")
    args = parser.parse_args(sys.argv[1:]);
    main(args);
