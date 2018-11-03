#ffmpeg -f avfoundation -list_devices true -i ""  # to see your available devices

#ffmpeg -f avfoundation -i "0" out.mpg
ffmpeg -f avfoundation -i "0" http://localhost:8082
#ffmpeg -f avfoundation -i "0"

#ffmpeg -f avfoundation -framerate 10 -i "0" -f mpeg1video -b 200k -r 30 -vf scale=1920:1080 http://127.0.0.1:8082/
#ffmpeg -f avfoundation -framerate 30 -pixel_format yuyv422 -i "0" http://localhost:8082 
