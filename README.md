# FaceRecognition
Face Recognition for Security and Absence Record with integrated with telegram bot for notifications.


## Installation:
    1. Install the dependencies

    2. Download the pretrained models here: https://drive.google.com/file/d/0Bx4sNrhhaBr3TDRMMUN3aGtHZzg/view?usp=sharing
    Or from release

        Then extract those files into models

    3. Run main_facerec.py

## Requirements:
    Python3 (3.5 ++ is recommended)

## Dependencies:

    opencv3

    numpy

    tensorflow ( 1.1.0-rc or  1.2.0 is recommended )


## Howto:
    `python3 main_facerec.py` to run the program
    `python3 main_facerec.py --mode "input"` to add new user. Start turning left, right, up, down after inputting the new name. Turn slowly to avoid blurred images
