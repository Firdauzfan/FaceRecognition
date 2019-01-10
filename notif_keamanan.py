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

def keamanan_notif():
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
                ceksql= "SELECT COUNT(nama) AS ceknama FROM `face_keamanan` WHERE DATE(`waktu`) = DATE(CURDATE()) AND aktif_notif='1' LIMIT 1"
                cursor.execute(ceksql)
                checking = cursor.fetchone()
                print(checking.get('ceknama'))

                ceknama= "SELECT nama,waktu FROM `face_keamanan` WHERE DATE(`waktu`) = DATE(CURDATE()) AND aktif_notif='1' LIMIT 1"
                cursor.execute(ceknama)
                checkingnama = cursor.fetchone()
                checkingjeneng=checkingnama.get('nama')
                checkingwaktu=checkingnama.get('waktu')
                waktu='%s' %checkingwaktu

                if checking.get('ceknama')>=1:
                    ceksqli= "SELECT `divisi`,`no_hp` FROM `employee` WHERE nama_pegawai=%s"
                    cursor.execute(ceksqli, (checkingjeneng))
                    checkingi = cursor.fetchone()

                    divisi=checkingi.get('divisi')
                    no_hp=checkingi.get('no_hp')

                    notify = Notify()
                    notify.send('%s Memasuki Ruangan Terlarang' %checkingjeneng)
                    text = '%s , dari Divisi %s dengan nomor hp %s Memasuki Ruangan Terlarang' %(checkingjeneng,divisi,no_hp)
                    id_tele= '205017793'
                    poto = open('hasil_keamanan/'+ checkingjeneng + waktu + ".jpg" , 'rb')
                    send_message_kemananan(text, id_tele, poto)

                    sql = "UPDATE `face_keamanan` SET `aktif_notif`=0 WHERE nama=%s"
                    cursor.execute(sql, (checkingjeneng))
            # connection is not autocommit by default. So you must commit to save
            # your changes.
            connection.commit()
            return True

        finally:
            connection.close()

keamanan_notif()
