import os
import cv2
import time
import argparse
import numpy as np
import tensorflow as tf
from align_custom import AlignCustom
from face_feature import FaceFeature
from mtcnn_detect import MTCNNDetect
from database import *
from notif import *
from tf_graph import FaceRecGraph
import sys
import traceback

from queue import Queue
from threading import Thread
from utils.app_utils import FPS, WebcamVideoStream

nama_detected_count={}
os.chdir('/home/gspe/Documents/firdauzfanani/FaceRecognition')

def face_recog(frame, sess, detection_graph):
    rects, landmarks = face_detect.detect_face(frame,30);#min face size is set to 80x80
    aligns = []
    positions = []
    for (i, rect) in enumerate(rects):
        aligned_face, face_pos = aligner.align(160,frame,landmarks[i])
        if len(aligned_face) == 160 and len(aligned_face[0]) == 160:
            aligns.append(aligned_face)
            positions.append(face_pos)
        else:
            print("Align face failed") #log
    if(len(aligns) > 0):
        features_arr = extract_feature.get_features(aligns)
        recog_data = findPeople(features_arr,positions)

        for (i,rect) in enumerate(rects):
            ts = time.time()
            timestamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')

            cv2.rectangle(frame,(rect[0],rect[1]),(rect[0] + rect[2],rect[1]+rect[3]),(255,0,0)) #draw bounding box for the face
            #cv2.putText(frame,recog_data[i][0]+" - "+str(recog_data[i][1])+"%",(rect[0],rect[1]),cv2.FONT_HERSHEY_SIMPLEX,1,(255,255,255),1,cv2.LINE_AA)
            cv2.putText(frame,recog_data[i][0],(rect[0],rect[1]),cv2.FONT_HERSHEY_SIMPLEX,1,(255,255,255),1,cv2.LINE_AA)

            if recog_data[i][0] != 'Unknown' and recog_data[i][1] >= 85:
                nama_detected_count.setdefault(recog_data[i][0], []).append(recog_data[i][0])
                print(nama_detected_count)
                kamera="kamera 1"
                if len(nama_detected_count[recog_data[i][0]])>=3:
                    nama_detected_count.clear()
                    if timestamp>'06:00:00' and timestamp<'08:45:00':
                        status="Tepat Waktu"#
                        insertdata= data(recog_data[i][0],kamera,frame)
                        insertdatang= datang(recog_data[i][0],kamera,status,frame)
                    elif timestamp>'08:45:00' and timestamp<'17:30:00':
                        status="Terlambat"
                        insertdata= data(recog_data[i][0],kamera,frame)
                        insertdatang= datang(recog_data[i][0],kamera,status,frame)
                    elif timestamp>'17:30:00' and timestamp<'23:59:00':
                        insertdata= data(recog_data[i][0],kamera,frame)
                        insertbalik= balik(recog_data[i][0],kamera,frame)
                    else:
                        insertdata= data(recog_data[i][0],kamera,frame)

    try:
        return dict(rects=rects,recog_data=recog_data)
    except:
        return {}

def worker(input_q, output_q):
    # Load a (frozen) Tensorflow model into memory.
    detection_graph = tf.Graph()
    sess = tf.Session(graph=detection_graph)

    fps = FPS().start()
    while True:
        fps.update()
        frame = input_q.get()
        #frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        #output_q.put(face_recog(frame_rgb, sess, detection_graph))
        output_q.put(face_recog(frame, sess, detection_graph))
    fps.stop()
    sess.close()

def findPeople(features_arr, positions, thres = 0.6, percent_thres = 75):
    '''
    :param features_arr: a list of 128d Features of all faces on screen
    :param positions: a list of face position types of all faces on screen
    :param thres: distance threshold
    :return: person name and percentage
    '''
    f = open('./facerec_128D.txt','r')
    data_set = json.loads(f.read());
    returnRes = [];
    for (i,features_128D) in enumerate(features_arr):
        result = "Unknown";
        smallest = sys.maxsize
        for person in data_set.keys():
            person_data = data_set[person][positions[i]];
            for data in person_data:
                distance = np.sqrt(np.sum(np.square(data-features_128D)))
                if(distance < smallest):
                    smallest = distance;
                    result = person;
        percentage =  min(100, 100 * thres / smallest)
        if percentage <= percent_thres :
            result = "Unknown"
        returnRes.append((result,percentage))
    return returnRes

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-src', '--source', dest='video_source', type=int,
                        default=0, help='Device index of the camera.')
    parser.add_argument('-wd', '--width', dest='width', type=int,
                        default=960, help='Width of the frames in the video stream.')
    parser.add_argument('-ht', '--height', dest='height', type=int,
                        default=720, help='Height of the frames in the video stream.')
    args = parser.parse_args()

    FRGraph = FaceRecGraph();
    aligner = AlignCustom();
    extract_feature = FaceFeature(FRGraph)
    face_detect = MTCNNDetect(FRGraph, scale_factor=2)

    input_q = Queue(5)  # fps is better if queue is higher but then more lags
    output_q = Queue()
    for i in range(1):
        t = Thread(target=worker, args=(input_q, output_q))
        t.daemon = True
        t.start()

    video_capture = WebcamVideoStream(src='rtsp://admin:gspe12345@192.168.0.25:554/PSIA/streaming/channels/801',
                                      width=args.width,
                                      height=args.height).start()
    # video_capture = WebcamVideoStream(src='rtsp://admin:gspe12345@192.168.0.25:554/PSIA/streaming/channels/301',
    #                                   width=args.width,
    #                                   height=args.height).start()
    fps = FPS().start()

    while True:
        frame = video_capture.read()
        input_q.put(frame)

        t = time.time()

        if output_q.empty():
            pass  # fill up queue
        else:
            font = cv2.FONT_HERSHEY_SIMPLEX
            datakeluar = output_q.get()
            try:
                rects = datakeluar['rects']
                recog_data = datakeluar['recog_data']
                for (i,rect) in enumerate(rects):
                    ts = time.time()
                    timestamp = datetime.datetime.fromtimestamp(ts).strftime('%H:%M:%S')

                    cv2.rectangle(frame,(rect[0],rect[1]),(rect[0] + rect[2],rect[1]+rect[3]),(255,0,0)) #draw bounding box for the face
                    #cv2.putText(frame,recog_data[i][0]+" - "+str(recog_data[i][1])+"%",(rect[0],rect[1]),cv2.FONT_HERSHEY_SIMPLEX,1,(255,255,255),1,cv2.LINE_AA)
                    cv2.putText(frame,recog_data[i][0],(rect[0],rect[1]),cv2.FONT_HERSHEY_SIMPLEX,1,(255,255,255),1,cv2.LINE_AA)

            except Exception as e:
                pass
        cv2.namedWindow('Face Recognition', cv2.WINDOW_NORMAL)
        cv2.imshow('Face Recognition', frame)
        fps.update()

        #print('[INFO] elapsed time: {:.2f}'.format(time.time() - t))

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    fps.stop()
    print('[INFO] elapsed time (total): {:.2f}'.format(fps.elapsed()))
    print('[INFO] approx. FPS: {:.2f}'.format(fps.fps()))

    video_capture.stop()
    cv2.destroyAllWindows()
