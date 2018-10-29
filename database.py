# -*- coding: utf-8 -*-
"""
Created on Mon Jan 15 12:50:14 2018
@author: Firdauz_Fanani
"""

import pymysql.cursors
import time
import datetime
import main_facerec
import os
from bot_notif import *
from email_notif import *
from notify_run import Notify
import cv2
import smtplib

# Connect to the database
def data(insertdata,kamera):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='face_recognition',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    try:
        with connection.cursor() as cursor:
            # Create a new record
            timestamp1 = '%Y-%m-%d %H:%i'
            ceksql= "SELECT COUNT(nama) AS ceknama FROM `face_keamanan` WHERE nama=%s AND DATE_FORMAT(waktu, %s) = DATE_FORMAT(NOW(), %s)"
            cursor.execute(ceksql, (insertdata,timestamp1,timestamp1))
            checking = cursor.fetchone()
            #print(checking)
            if checking.get('ceknama')<1:
                ts = time.time()
                timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
                sql = "INSERT INTO `face_keamanan`(`nama`, `waktu`, `kamera`) VALUES (%s,%s,%s) "
                cursor.execute(sql, (insertdata,timestamp,kamera))



        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
        return True

    finally:
        connection.close()

def datang(insertdata,kamera,status,frame):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='face_recognition',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    try:
        with connection.cursor() as cursor:
            # Create a new record
            ceksql= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE nama_pegawai=%s AND DATE(`waktu_masuk`) = DATE(CURDATE())"
            cursor.execute(ceksql, (insertdata))
            checking = cursor.fetchone()
            #print(checking)
            if checking.get('ceknama')<1:
                ts = time.time()
                timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
                namefile = "hasil_absensi/"+ insertdata + timestamp + ".png"
                cv2.imwrite(namefile, frame)

                cekempid= "SELECT id_pegawai FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(cekempid, (insertdata))
                emp_ids = cursor.fetchone()
                emp_id= emp_ids.get('id_pegawai')
                state="IN"
                sql = "INSERT INTO `face_absensi`(`employee_id`, `nama_pegawai`, `waktu_masuk`,`kamera`, `note`, `state`) VALUES (%s,%s,%s,%s,%s,%s) "
                cursor.execute(sql, (emp_id,insertdata,timestamp,kamera,status,state))
                os.system('spd-say "Welcome to Graha Sumber Prima Elektronik %s"' %insertdata)

                text = 'Selamat Datang %s , Hari ini kamu datang %s' %(insertdata,status)
                cekid_tele= "SELECT id_telegram FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(cekid_tele, (insertdata))
                id_teles = cursor.fetchone()
                id_tele= id_teles.get('id_telegram')
                poto = open('hasil_absensi/'+ insertdata + timestamp + ".png" , 'rb')
                send_message(text, id_tele,poto)

                if status=='Terlambat':
                    poto = open('hasil_absensi/'+ insertdata + timestamp + ".png" , 'rb')
                    text_terlambat = 'Kepada Human Resource Development, kami memberitahukan bahwa karyawan dengan nama %s , Hari ini datang %s pada tanggal dan pukul %s' %(insertdata,status,timestamp)
                    id_tele_terlambat='205017793'
                    send_message(text_terlambat, id_tele_terlambat, poto)
                    main_email(insertdata,status,timestamp)

        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
        return True

    finally:
        connection.close()

def balik(insertdata,kamera,frame):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='face_recognition',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    try:
        with connection.cursor() as cursor:
            # Create a new record
            timestamp1 = '%Y-%m-%d %H:%i'
            ceksql= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE nama_pegawai=%s AND DATE(`waktu_masuk`) = DATE(CURDATE()) AND state='IN'"
            cursor.execute(ceksql, (insertdata))
            checking = cursor.fetchone()
            #print(checking)
            if checking.get('ceknama')==1:
                ts = time.time()
                state='OUT'
                timestamp = datetime.datetime.fromtimestamp(ts).strftime('%Y-%m-%d %H:%M:%S')
                namefile = "hasil_absensi/"+ insertdata + timestamp + ".png"
                cv2.imwrite(namefile, frame)
                sql = "UPDATE `face_absensi` SET `waktu_keluar`=%s,`state`=%s WHERE nama_pegawai=%s"
                cursor.execute(sql, (timestamp,state,insertdata))
                os.system('spd-say "Goodbye %s ,Take care in your way"' %insertdata)

                text = 'Selamat Tinggal %s , Hati-hati di perjalanan pulang' %insertdata
                cekid_tele= "SELECT id_telegram FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(cekid_tele, (insertdata))
                id_teles = cursor.fetchone()
                id_tele= id_teles.get('id_telegram')
                poto = open('hasil_absensi/'+ insertdata + timestamp + ".png" , 'rb')
                send_message(text, id_tele,poto)



        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
        return True

    finally:
        connection.close()

def checking(insertdata,kamera):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='face_recognition',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    try:
        with connection.cursor() as cursor:
            # Create a new record
            ceksql= "SELECT `divisi` FROM `employee` WHERE nama_pegawai=%s"
            cursor.execute(ceksql, (insertdata))
            checking = cursor.fetchone()
            #print(checking.get('divisi'))
            if checking.get('divisi')=='IT' and kamera=='kamera 1':
                notify = Notify()
                notify.send('%s Memasuki Ruangan Terlarang' %insertdata)
                text = '%s , Memasuki Ruangan Terlarang' %insertdata
                id_tele= '205017793'
                send_message(text, id_tele)


        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
        return True

    finally:
        connection.close()
