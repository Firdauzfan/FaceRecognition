from notif import *
import time
import datetime
import pymysql.cursors
import time
import datetime
import os
from bot_notif import *
from email_notif import *
from notify_run import Notify
import cv2
import smtplib
import argparse
import sys
from notify_run import Notify

os.chdir('/home/gspe/Documents/firdauzfanani/FaceRecognition')

def notif():
        try:
            connection = pymysql.connect(host='localhost',
                                         user='root',
                                         password='root',
                                         db='absensi',
                                         unix_socket="/var/run/mysqld/mysqld.sock",
                                         port=3306,
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            with connection.cursor() as cursor:
                # Create a new record
                ceksql= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE DATE(`waktu_masuk`) = DATE(CURDATE()) AND aktif_notif='1' LIMIT 1"
                cursor.execute(ceksql)
                checking = cursor.fetchone()
                print(checking.get('ceknama'))
                if checking.get('ceknama')>=1:
                    ceksql= "SELECT nama_pegawai,waktu_masuk FROM `face_absensi` WHERE DATE(`waktu_masuk`) = DATE(CURDATE()) AND aktif_notif='1' LIMIT 1"
                    cursor.execute(ceksql)
                    checking = cursor.fetchone()
                    insertdata=checking.get('nama_pegawai')
                    ts = time.time()
                    timestamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')
                    # ts = checking.get('waktu_masuk')
                    # timestamp = ts.strftime('%H:%M:%S')
                    if timestamp>'06:00:00' and timestamp<'08:45:00':
                        status="Tepat Waktu"
                        notif=notif_datang(insertdata,status)
                        #os.system("mpg321 AudioFile/'%s Welcome.mp3' -quiet" %insertdata)
                    elif timestamp>'08:45:00' and timestamp<'17:30:00':
                        status="Terlambat"
                        notif=notif_datang(insertdata,status)
                        #os.system("mpg321 AudioFile/'%s Welcome.mp3' -quiet" %insertdata)
                    elif timestamp>'17:30:00' and timestamp<'23:59:00':
                        notif=balik_notif(insertdata)
                        #os.system("mpg321 AudioFile/'%s Goodbye.mp3' -quiet" %insertdata)
            connection.commit()
            return True

        finally:
            connection.close()

notif()
