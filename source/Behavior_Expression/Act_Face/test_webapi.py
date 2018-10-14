# -*- coding: utf-8 -*-

import json

# ----------------------------------------------------------
#  naver_tts.py: NaverTTS
from Behavior_Expression.Act_Speech.naver_tts import NaverTTS  # TTS: NaverTTS

# -----------------------
# Web_API class for web POST
from Interface.Web.post import Web_API

def main():
    # --------------------------------
    # Create NaverTTS Class
    tts = NaverTTS(0,-1)    # Create a NaverTTS() class from tts/naver_tts.py
    #tts.play("안녕하십니까?")

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

    #block = True
    #tts.play(message, block)

#----------------------------------------------------
# 메인 함수
#----------------------------------------------------
if __name__ == '__main__':

    main()
