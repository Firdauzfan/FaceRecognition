import os
import cv2
import argparse
import sys

os.chdir('/home/gspe/Documents/firdauzfanani/FaceRecognition')

parser = argparse.ArgumentParser()
parser.add_argument("--user", type=str, help="Run User Notif Suara", default="None")
parser.add_argument("--mode", type=str, help="Run Mode Notif Suara", default="None")
args = parser.parse_args(sys.argv[1:])

user = args.user
mode = args.mode

os.system("mpg321 AudioFile/'%s %s.mp3' -quiet" %(user,mode))
