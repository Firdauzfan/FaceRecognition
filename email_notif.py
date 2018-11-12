import smtplib

from string import Template
import urllib.request

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.image import MIMEImage
import os

os.chdir('/home/gspe/Documents/firdauzfanani/FaceRecognition')

MY_ADDRESS = 'gspeintercon@gmail.com'
PASSWORD = 'gspegspe'

def get_contacts(filename):
    """
    Return two lists names, emails containing names and email addresses
    read from a file specified by filename.
    """

    names = []
    emails = []
    with open(filename, mode='r', encoding='utf-8') as contacts_file:
        for a_contact in contacts_file:
            names.append(a_contact.split()[0])
            emails.append(a_contact.split()[1])
    return names, emails

def main_email(insertdata,status,timestamp,poto,no_hp):
    names, emails = get_contacts('mycontacts.txt') # read contacts

    # set up the SMTP server
    s = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    s.ehlo()
    s.login(MY_ADDRESS, PASSWORD)

    # For each contact, send the email:
    for name, email in zip(names, emails):
        msg = MIMEMultipart()       # create a message

        # add in the actual person name to the message template
        #message = message_template.substitute(PERSON_NAME=name.title())
        message = """\
Dear %s,

Kepada Human Resource Development,
Kami memberitahukan bahwa karyawan dengan nama %s dan no hp = %s,
Hari ini datang %s pada tanggal dan pukul %s .

Terima kasih.
        """ % (name.title(),insertdata,no_hp,status,timestamp)

        # setup the parameters of the message
        msg['From']=MY_ADDRESS
        msg['To']=email
        msg['Subject']="Laporan Keterlambatan Karyawan"

        # add in the message body
        fp=open('hasil_absensi/'+ insertdata + timestamp + ".jpg", 'rb')
        image = MIMEImage(fp.read(), _subtype='jpg')
        image.add_header('Content-ID', '<' + insertdata + '>')
        msg.attach(image)
        msg.attach(MIMEText(message))

        message = 'Subject: {}\n\n{}'.format(msg['Subject'], message)
        # send the message via the server set up earlier.
        s.sendmail(msg['From'],msg['To'],msg.as_string())
        del msg

    # Terminate the SMTP session and close the connection
    s.close()

def main_email_terlambat(insertdata,status,timestamp,poto,no_hp,warn):
    names, emails = get_contacts('mycontacts.txt') # read contacts

    # set up the SMTP server
    s = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    s.ehlo()
    s.login(MY_ADDRESS, PASSWORD)

    # For each contact, send the email:
    for name, email in zip(names, emails):
        msg = MIMEMultipart()       # create a message

        # add in the actual person name to the message template
        #message = message_template.substitute(PERSON_NAME=name.title())
        message = """\
Dear %s,

Kepada Human Resource Development,
kami memberitahukan bahwa karyawan dengan nama %s dan no hp = %s sudah terlambat sebanyak 6 kali atau lebih dari 30 Menit sehingga perlu diberikan %s,
Hari ini datang %s pada tanggal dan pukul %s .

Terima kasih.
        """ % (name.title(),insertdata,no_hp,warn,status,timestamp)

        # setup the parameters of the message
        msg['From']=MY_ADDRESS
        msg['To']=email
        msg['Subject']="Peringatan Keterlambatan Karyawan"

        # add in the message body
        fp=open('hasil_absensi/'+ insertdata + timestamp + ".jpg", 'rb')
        image = MIMEImage(fp.read(), _subtype='jpg')
        image.add_header('Content-ID', '<' + insertdata + '>')
        msg.attach(image)
        msg.attach(MIMEText(message))

        message = 'Subject: {}\n\n{}'.format(msg['Subject'], message)
        # send the message via the server set up earlier.
        s.sendmail(msg['From'],msg['To'],msg.as_string())
        del msg

    # Terminate the SMTP session and close the connection
    s.close()
