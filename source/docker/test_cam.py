import cv2
import numpy as np

def tracking():
    #cap = cv2.VideoCapture(0)
    #cap = cv2.VideoCapture('http://192.168.1.20:8160')
    cap = cv2.VideoCapture('rtsp://192.168.1.20:8160/unicast')
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
<<<<<<< HEAD

=======
>>>>>>> 5618cc74bd06b82dbf200f043ccdb53b9a7a7263
