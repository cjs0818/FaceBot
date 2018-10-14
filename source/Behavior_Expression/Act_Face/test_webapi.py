# -*- coding: utf-8 -*-

import json

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
    ani_parameter = {
            'video_path': "./ani01_unknown_approach.mov",
            'pause': 0,
            'audio_enable': 0,
            'video_delay': 100,
            'audio_length': len(message)
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
