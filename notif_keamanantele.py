import pymysql.cursors
import time
import datetime
import os
import cv2
import smtplib
import argparse
import sys
from bot_notif import *
from email_notif import *
from notify_run import Notify

os.chdir('/home/gspe/Documents/firdauzfanani/FaceRecognition')

def keamanan_notif(username,timewaktu):
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
                ceksqli= "SELECT `divisi`,`no_hp` FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(ceksqli, (username))
                checkingi = cursor.fetchone()

                waktu= timewaktu
                divisi=checkingi.get('divisi')
                no_hp=checkingi.get('no_hp')

                notify = Notify()
                notify.send('%s Memasuki Ruangan Terlarang' %username)
                text = '%s , dari Divisi %s dengan nomor hp %s Memasuki Ruangan Terlarang' %(username,divisi,no_hp)
                id_tele= '205017793'
                poto = open('hasil_keamanan/'+ username + waktu + ".jpg" , 'rb')
                send_message_kemananan(text, id_tele, poto)

                sql = "UPDATE `face_keamanan` SET `aktif_notif`=0 WHERE nama=%s"
                cursor.execute(sql, (username))
            # connection is not autocommit by default. So you must commit to save
            # your changes.
            connection.commit()
            return True

        finally:
            connection.close()

parser = argparse.ArgumentParser()
parser.add_argument("--user", type=str, help="Run Notif Keamanan", default="None")
parser.add_argument("--waktu", type=str, help="Run Notif Waktu Keamanan", default="None")
args = parser.parse_args(sys.argv[1:])

user = args.user
waktu = args.waktu

keamanan_notif(user,waktu)
