# -*- coding: utf-8 -*-

import time
from imutils.video import VideoStream
import imutils
import cv2

prevTime = 0

def check_fps():
    global prevTime

    #현재 시간 가져오기 (초단위로 가져옴)
    curTime = time.time()

    #현재 시간에서 이전 시간을 빼면?
    #한번 돌아온 시간!!
    sec = curTime - prevTime
    #이전 시간을 현재시간으로 다시 저장시킴
    prevTime = curTime

    # 프레임 계산 한바퀴 돌아온 시간을 1초로 나누면 된다.
    # 1 / time per frame
    fps = 1/(sec)

    return fps


'''
# -- Video Capture --
cap = cv2.VideoCapture(0)
cap.set(3, 320)
cap.set(4, 240)
'''

# -- VideoStream --
vs = VideoStream(src=0).start()

time.sleep(1.0)

while True:
    # -- Video Capture --
    #ret, frame = cap.read()

    # -- VideoStream --
    frame = vs.read()
    frame = imutils.resize(frame, width = 320)

    cv2.putText(frame, "fps: {:.2f}".format(check_fps()), (10,130), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (200,30,20), 2)

    cv2.imshow("Frame", frame)

    key = cv2.waitKey(10) & 0xFF
    if key == ord("q"):
        break

cv2.destroyAllWindows()
vs.stop()
