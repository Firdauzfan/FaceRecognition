# -*- coding: utf-8 -*-
"""
Created on Mon Jan 15 12:50:14 2018
@author: Firdauz_Fanani
"""

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
                namefile = "hasil_absensi/"+ insertdata + timestamp + ".jpg"
                cv2.imwrite(namefile, frame)

                cekempid= "SELECT id_telegram,id_pegawai,warning1,warning2,warning3,no_hp FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(cekempid, (insertdata))
                dataemp = cursor.fetchone()
                emp_id= dataemp.get('id_pegawai')
                state="IN"
                sql = "INSERT INTO `face_absensi`(`employee_id`, `nama_pegawai`, `waktu_masuk`,`kamera`, `note`, `state`, `aktif_terlambat`,`aktif_notif`) VALUES (%s,%s,%s,%s,%s,%s,%s,%s) "
                cursor.execute(sql, (emp_id,insertdata,timestamp,kamera,status,state,'0','1'))
                os.system('spd-say "Welcome to Graha Sumber Prima Elektronik %s"' %insertdata)


                if status=='Terlambat':
                    sql = "UPDATE `face_absensi` SET `aktif_terlambat`='1' WHERE nama_pegawai=%s AND DATE(`waktu_masuk`) = DATE(CURDATE())"
                    cursor.execute(sql, (insertdata))

                    ceksqlterlambat= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE nama_pegawai=%s AND aktif_terlambat=1"
                    cursor.execute(ceksqlterlambat, (insertdata))
                    checkingterlambat = cursor.fetchone()
                    #print(checking)
                    if checkingterlambat.get('ceknama')==3:
                        if warning1==None and warning2==None and warning3==None:
                            warn='Surat Peringatan 1'
                            updatewarning= "UPDATE `employee` SET `warning1`=%s WHERE nama_pegawai=%s"
                            cursor.execute(updatewarning, (warn,insertdata))

                            updateterlambat= "UPDATE `face_absensi` SET `aktif_terlambat`='0' WHERE nama_pegawai=%s"
                            cursor.execute(updateterlambat, (insertdata))
                        elif warning1 !=None and warning2==None and warning3 ==None:
                            warn='Coaching By HRD'
                            updatewarning= "UPDATE `employee` SET `warning2`=%s WHERE nama_pegawai=%s"
                            cursor.execute(updatewarning, (warn,insertdata))

                            updateterlambat= "UPDATE `face_absensi` SET `aktif_terlambat`='0' WHERE nama_pegawai=%s"
                            cursor.execute(updateterlambat, (insertdata))
                        else:
                            warn='Penalty Sesuai Kesepakatan'
                            updatewarning= "UPDATE `employee` SET `warning3`=%s WHERE nama_pegawai=%s"
                            cursor.execute(updatewarning, (warn,insertdata))

                            updateterlambat= "UPDATE `face_absensi` SET `aktif_terlambat`='0' WHERE nama_pegawai=%s"
                            cursor.execute(updateterlambat, (insertdata))
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
                namefile = "hasil_absensi/"+ insertdata + timestamp + ".jpg"
                cv2.imwrite(namefile, frame)
                sql = "UPDATE `face_absensi` SET `waktu_keluar`=%s,`state`=%s,`aktif_notif`='1' WHERE nama_pegawai=%s"
                cursor.execute(sql, (timestamp,state,insertdata))
                os.system('spd-say "Goodbye %s ,Take care in your way"' %insertdata)

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
