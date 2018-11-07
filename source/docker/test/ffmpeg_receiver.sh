#ffmpeg -f avfoundation -framerate 10 -i "0" -f mpeg1video -b 200k -r 30 -vf scale=1920:1080 http://127.0.0.1:8082/
ffmpeg -f avfoundation -framerate 30 -pixel_format yuyv422 -i "0" out.avi
