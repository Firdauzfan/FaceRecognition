# FaceRecognition
Face Recognition for Security and Absence Record with integrated with telegram bot for notifications.


## Installation:
    1. Install the dependencies

    2. Download the pretrained models from release

        Then extract those files into models

    3. Run main_facerec.py

## Requirements:
    Python3 (3.5 ++ is recommended)

## Dependencies:

    opencv3

    numpy

    sudo apt-get install mpg321

    tensorflow ( 1.1.0-rc or  1.2.0 is recommended )


## Howto:
    Without Multi Threading:
    `python3 main_facerec.py` to run the program
    atau `python3 main_facerec2.py` untuk run 2 kamera sekaligus
    atau `python3 main_facerec3.py` untuk run 3 kamera sekaligus

    With Multi Threading:
    `python3 main_facerec_multiprocess.py` to run the program
    atau `python3 main_facerec_multiprocess2.py` untuk run 2 kamera sekaligus
    atau `python3 main_facerec_multiprocess3.py` untuk run 3 kamera sekaligus

    `python3 main_facerec.py --mode "input"` to add new user. Start turning left, right, up, down after inputting the new name. Turn slowly to avoid blurred images

    Tambahkan pada crontab -e linux untuk back up notif:
    */1 * * * * /usr/bin/python3 ~/Documents/firdauzfanani/FaceRecognition/notif_absensi.py
    */1 * * * * /usr/bin/python3 ~/Documents/firdauzfanani/FaceRecognition/notif_keamanan.py
