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

def notif_datang(insertdata,status):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='face_recognition',
                                 unix_socket="/var/run/mysqld/mysqld.sock",
                                 port=3306,
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    try:
        with connection.cursor() as cursor:
            # Create a new record
            ceksql= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE nama_pegawai=%s AND aktif_notif='1' AND DATE(`waktu_masuk`) = DATE(CURDATE())"
            cursor.execute(ceksql, (insertdata))
            checking = cursor.fetchone()
            waktu=checking.get('waktu_masuk')
            #print(checking)
            if checking.get('ceknama')==1:
                cekwaktu= "SELECT waktu_masuk FROM `face_absensi` WHERE nama_pegawai=%s AND aktif_notif='1' AND DATE(`waktu_masuk`) = DATE(CURDATE())"
                cursor.execute(cekwaktu, (insertdata))
                checkingwaktu = cursor.fetchone()
                waktumasuk=checkingwaktu.get('waktu_masuk')
                waktu='%s' %waktumasuk

                cekempid= "SELECT id_telegram,id_pegawai,warning1,warning2,warning3,no_hp FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(cekempid, (insertdata))
                dataemp = cursor.fetchone()

                text = 'Selamat Datang %s , Hari ini kamu datang %s' %(insertdata,status)
                id_tele= dataemp.get('id_telegram')
                poto = open('hasil_absensi/'+ insertdata + waktu + ".jpg" , 'rb')
                send_message(text,id_tele,poto)

                warning1= dataemp.get('warning1')
                warning2= dataemp.get('warning2')
                warning3= dataemp.get('warning3')
                no_hp= dataemp.get('no_hp')

                if status=='Terlambat':
                    text_terlambat = 'Kepada Human Resource Development, kami memberitahukan bahwa karyawan dengan nama %s dan no hp= %s , Hari ini datang %s pada tanggal dan pukul %s' %(insertdata,no_hp,status,waktu)
                    id_tele_terlambat='668662889'
                    poto = open('hasil_absensi/'+ insertdata + waktu + ".jpg" , 'rb')
                    send_message(text_terlambat,id_tele_terlambat,poto)
                    main_email(insertdata,status,waktu,poto,no_hp)

                    ceksqlterlambat= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE nama_pegawai=%s AND aktif_terlambat=1"
                    cursor.execute(ceksqlterlambat, (insertdata))
                    checkingterlambat = cursor.fetchone()

                    ceksqlwaktutelat="SELECT SUM(selisih_waktu) AS waktutelat FROM `face_absensi` WHERE nama_pegawai=%s AND MONTH(waktu_masuk)=MONTH(CURDATE())"
                    cursor.execute(ceksqlwaktutelat, (insertdata))
                    checkingwaktutelat = cursor.fetchone()
                    #print(checking)
                    if checkingterlambat.get('ceknama')==6 or checkingwaktutelat.get('waktutelat')>30:
                        poto = open('hasil_absensi/'+ insertdata + waktu + ".jpg" , 'rb')
                        if warning1==None and warning2==None and warning3==None:
                            warn='Surat Peringatan 1'

                            text_terlambat = 'Kepada Human Resource Development, kami memberitahukan bahwa karyawan dengan nama %s dan no hp= %s sudah terlambat sebanyak 6 kali atau lebih dari 30 Menit sehingga perlu diberikan %s, Hari ini datang %s pada tanggal dan pukul %s' %(insertdata,no_hp,warn,status,waktu)
                            id_tele_terlambat='668662889'
                            send_message(text_terlambat,id_tele_terlambat,poto)
                            main_email_terlambat(insertdata,status,waktu,poto,no_hp,warn)

                        elif warning1 !=None and warning2==None and warning3 ==None:
                            warn='Coaching By HRD'

                            text_terlambat = 'Kepada Human Resource Development, kami memberitahukan bahwa karyawan dengan nama %s dan no hp= %s sudah terlambat sebanyak 6 kali atau lebih dari 30 Menit sehingga perlu diberikan %s, Hari ini datang %s pada tanggal dan pukul %s' %(insertdata,no_hp,warn,status,waktu)
                            id_tele_terlambat='668662889'
                            send_message(text_terlambat,id_tele_terlambat,poto)
                            main_email_terlambat(insertdata,status,waktu,poto,no_hp,warn)

                        else:
                            warn='Penalty Sesuai Kesepakatan'

                            text_terlambat = 'Kepada Human Resource Development, kami memberitahukan bahwa karyawan dengan nama %s dan no hp= %s sudah terlambat sebanyak 6 kali atau lebih dari 30 Menit sehingga perlu diberikan %s, Hari ini datang %s pada tanggal dan pukul %s' %(insertdata,no_hp,warn,status,waktu)
                            id_tele_terlambat='668662889'
                            send_message(text_terlambat,id_tele_terlambat,poto)
                            main_email_terlambat(insertdata,status,waktu,poto,no_hp,warn)

            sql = "UPDATE `face_absensi` SET `aktif_notif`='0' WHERE nama_pegawai=%s AND DATE(`waktu_masuk`) = DATE(CURDATE())"
            cursor.execute(sql, (insertdata))
        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
        return True

    finally:
        connection.close()

def balik_notif(insertdata):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='root',
                                 db='face_recognition',
                                 unix_socket="/var/run/mysqld/mysqld.sock",
                                 port=3306,
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)


    try:
        with connection.cursor() as cursor:
            # Create a new record
            timestamp1 = '%Y-%m-%d %H:%i'
            ceksql= "SELECT COUNT(nama_pegawai) AS ceknama FROM `face_absensi` WHERE nama_pegawai=%s AND DATE(`waktu_masuk`) = DATE(CURDATE()) AND aktif_notif='1'"
            cursor.execute(ceksql, (insertdata))
            checking = cursor.fetchone()
            #print(checking)
            if checking.get('ceknama')==1:
                cekwaktu= "SELECT waktu_keluar FROM `face_absensi` WHERE nama_pegawai=%s AND aktif_notif='1' AND DATE(`waktu_masuk`) = DATE(CURDATE())"
                cursor.execute(cekwaktu, (insertdata))
                checkingwaktu = cursor.fetchone()
                waktukeluar=checkingwaktu.get('waktu_keluar')
                waktu='%s' %waktukeluar

                text = 'Selamat Tinggal %s , Hati-hati di perjalanan pulang' %insertdata
                cekid_tele= "SELECT id_telegram FROM `employee` WHERE nama_pegawai=%s"
                cursor.execute(cekid_tele, (insertdata))
                id_teles = cursor.fetchone()
                id_tele= id_teles.get('id_telegram')
                poto = open('hasil_absensi/'+ insertdata + waktu + ".jpg" , 'rb')
                send_message(text,id_tele,poto)

            sql = "UPDATE `face_absensi` SET `aktif_notif`='0' WHERE nama_pegawai=%s AND DATE(`waktu_masuk`) = DATE(CURDATE())"
            cursor.execute(sql, (insertdata))

        # connection is not autocommit by default. So you must commit to save
        # your changes.
        connection.commit()
        return True

    finally:
        connection.close()
