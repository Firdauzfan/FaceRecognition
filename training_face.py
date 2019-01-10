import cv2
from align_custom import AlignCustom
from face_feature import FaceFeature
from mtcnn_detect import MTCNNDetect
from tf_graph import FaceRecGraph
import argparse
import sys
import json
import numpy as np
import os

os.chdir('/home/gspe/Documents/firdauzfanani/FaceRecognition')

def main_training():
    vs = cv2.VideoCapture(1)

    name = sys.argv[1]
    print(name)
    # print("Input User baru ID tanpa menggunakan spasi:")
    # nama_baru = input()
    nama_baru=name
    f = open('./facerec_128D.txt','r')
    data_set = json.loads(f.read())
    person_imgs = {"Left" : [], "Right": [], "Center": []}
    person_features = {"Left" : [], "Right": [], "Center": []}
    print("Arahkan Wajah Ke Kanan, Tengah, Kiri Secara Perlahan-lahan. Tekan 'q' untuk menyimpan user baru")
    while True:
        _, frame = vs.read()
        rects, landmarks = face_detect.detect_face(frame, 80)
        for (i, rect) in enumerate(rects):
            aligned_frame, pos = aligner.align(160,frame,landmarks[i])
            if len(aligned_frame) == 160 and len(aligned_frame[0]) == 160:
                person_imgs[pos].append(aligned_frame)
                cv2.namedWindow('Captured face', cv2.WINDOW_NORMAL)
                cv2.imshow("Captured face", aligned_frame)

        key = cv2.waitKey(1) & 0xFF
        if key == ord("s"):
            break
        elif key == ord("c"):
            person_imgs.clear()
            person_features.clear()
            del nama_baru
            break

    for pos in person_imgs:
        person_features[pos] = [np.mean(extract_feature.get_features(person_imgs[pos]),axis=0).tolist()]
    data_set[nama_baru] = person_features
    f = open('./facerec_128D.txt', 'w')
    f.write(json.dumps(data_set))

if __name__ == '__main__':
    FRGraph = FaceRecGraph()
    aligner = AlignCustom()
    extract_feature = FaceFeature(FRGraph)
    face_detect = MTCNNDetect(FRGraph, scale_factor=2) #scale_factor, rescales image for faster detection
    main_training()
