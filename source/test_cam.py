import cv2
import numpy as np

def tracking():

    #cap = cv2.VideoCapture(0)
    #cap = cv2.VideoCapture('http://192.168.1.20:8160')
    #cap = cv2.VideoCapture('rtsp://192.168.1.20:8160/unicast')

    print(cv2.getBuildInformation())


    #-------  from raspivid + cvlc: raspivid -o - -t 0 -hf -w 800 -h 400 -fps 24 |cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8160}' :demux=h264
    cam_id = 'http://192.168.1.20:8160'

    #-------  from 스마트폰app:  'IP Webcam'
    #cam_id = 'http://192.168.1.12:8080/video'

    #-------  from v4l2-rtsp server: ./h264_v4l2_rtspserver -F 25 -W 1280 -H 720 -P 8555 /dev/video0
    # Too slow after face detection
    #cam_id = 'rtsp://192.168.25.19:8160/unicast'


    #-------  command-line에서는 성공 but OpenCV에서는 실패
    #cam_id = 'tcpclientsrc host=192.168.25.19 port=8160 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false'


    #------ Failure
    #cam_id = 'udpsrc port=8160 ! application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec ! autovideosink sync=false'


    #cap = cv2.VideoCapture(cam_id, cv2.CAP_GSTREAMER)
    cap = cv2.VideoCapture(cam_id)

    print(cap.isOpened())

    cap.set(3,640)
    cap.set(4,480)

    while True:
        ret, frame = cap.read()
        cv2.imshow('video', frame)
        if cv2.waitKey(10) & 0xff == ord('q'):
            break
    cv2.destroyAllwindows()

if __name__ == '__main__':
    tracking()
