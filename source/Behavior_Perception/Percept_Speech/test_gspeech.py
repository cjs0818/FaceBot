# -*- coding: utf-8 -*-

import gspeech
import time
def main():
    gsp = gspeech.Gspeech()
    while True:

        '''
        # 음성 인식 될때까지 대기 한다.
        stt = gsp.getText()
        #if stt is None:  # Google Speech는 1분마다 끊어짐에 유의
        #    break


        if stt is not None:
            print(stt)
            if (u'끝내자' in stt):
                break
        else:
            # 구글 음성인식기의 경우 1분 제한을 넘으면 None 발생 -> 다시 클래스를 생성시킴
            print("Recreate Gspeech()!")
            del gsp
            gsp = gspeech.Gspeech()
        '''

        #gsp.resumeMic()
        try:
            content = gsp._buff.get(False)
            # content = gsp.getText(block)
            if content is not None:
                print(content)

            else:
                # 구글 음성인식기의 경우 1분 제한을 넘으면 None 발생 -> 다시 클래스를 생성시킴
                print("Recreate Gspeech()!")
                del gsp
                gsp = Gspeech()
                content = None
        except:
            pass


        time.sleep(0.01)



if __name__ == '__main__':
    main()
