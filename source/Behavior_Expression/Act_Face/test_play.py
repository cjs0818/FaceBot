import numpy as np
import cv2

#cap = cv2.VideoCapture('ani01_Idle.mov')
cap = cv2.VideoCapture('https://ganbjheo.p72.rt3.io')
cv2.namedWindow('Video Play',cv2.WINDOW_AUTOSIZE)

while(cap.isOpened()):
    ret, frame = cap.read()

    #gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    #cv2.imshow('frame',gray)
    try:
        cv2.imshow('frame',frame)
    except:
        pass

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
