import cv2

def main():
    vs = cv2.VideoCapture("rtsp://admin:gspe12345@192.168.0.21:554/PSIA/streaming/channels/101")
    while True:
        _,frame = vs.read()
        cv2.imshow("Live Camera",frame)
        key = cv2.waitKey(1) & 0xFF
        if key == ord("q"):
            break

if __name__ == '__main__':
    main()
