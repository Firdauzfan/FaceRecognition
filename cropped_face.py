import cv2
from align_custom import AlignCustom
from mtcnn_detect import MTCNNDetect
from tf_graph import FaceRecGraph
import sys
import numpy as np

def main():
    vs = cv2.VideoCapture('rtsp://admin:gspe12345@192.168.0.21:554/PSIA/streaming/channels/101'); #get input from webcam

    person_imgs = {"Left" : [], "Right": [], "Center": []};
    person_features = {"Left" : [], "Right": [], "Center": []};
    print("Please start turning slowly. Press 'q' to save and add this new user to the dataset");
    while True:
        _, frame = vs.read();
        rects, landmarks = face_detect.detect_face(frame, 30);  # min face size is set to 80x80
        for (i, rect) in enumerate(rects):
            aligned_frame, pos = aligner.align(160,frame,landmarks[i]);
            if len(aligned_frame) == 160 and len(aligned_frame[0]) == 160:
                person_imgs[pos].append(aligned_frame)
                cv2.imshow("Captured face", aligned_frame)
        key = cv2.waitKey(1) & 0xFF
        if key == ord("q"):
            break


if __name__ == '__main__':
    FRGraph = FaceRecGraph()
    aligner = AlignCustom()
    face_detect = MTCNNDetect(FRGraph, scale_factor=2) #scale_factor, rescales image for faster detection
    main()
