# -*- coding: utf-8 -*-

import json

import os

# -----------------------
# Web_API class for web POST
from Interface.Web.post import Web_API

def main():

    # -----------------------
    # Web_API class for web POST
    web_api = Web_API()

    url = 'http://192.168.25.7:60000/message'
    message = "안녕하세요."
    message = message + message + message + message + message

    #BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    #video_path = BASE_DIR + '/ani01_Hi_Short.mov'
    video_path = './ani01_Hi_Short.mov'
    ani_parameter = {
            'video_path': video_path,
            'pause': 0,
            'audio_enable': 0,
            'video_delay': 120,
            'audio_length': len(message),
            'loop_path': video_path
        }
    data_send = {
            'speech': message,
            'param': ani_parameter,
        }

    web_api.send_post(data_send, url)


#----------------------------------------------------
# 메인 함수
#----------------------------------------------------
if __name__ == '__main__':

    main()
