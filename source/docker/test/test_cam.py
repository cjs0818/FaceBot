import cv2
import numpy as np
from imutils.video import VideoStream
import imutils

def tracking():

    cam_id = 0
    #cam_id = "http://localhost:8082"
    cam_id = "http://192.168.25.16:8160"

    video_stream = True
    #video_stream = False
    if video_stream == True:
        # -----------------------------------------------
        # IMPORTANT!!!!
        # -- VideoStream: Fast enough <- using threading
        # --    VideoStream vs. WebcamVideoStream ???
        cap = VideoStream(src=cam_id).start()
        frame = cap.read()
        sample_frame = imutils.resize(frame, width=320)
    else:
        # -----------------------------------------------
        # -- VideoCapture: Slow
        cap = cv2.VideoCapture(cam_id)
        print(cap.isOpened())
        cap.set(3, 320)
        cap.set(4, 240)
        ret, sample_frame = cap.read()

    while True:
        # Capture frame-by-frame
        if video_stream == True:
            frame = cap.read()
            frame = imutils.resize(frame, width=640)
        else:
            ret, frame = cap.read()

        cv2.imshow('video', frame)
        if cv2.waitKey(10) & 0xff == ord('q'):
            break
    cv2.destroyAllwindows()

if __name__ == '__main__':
    tracking()
