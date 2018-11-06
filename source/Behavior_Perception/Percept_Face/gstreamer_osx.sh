#!/bin/bash

#MY_IP=$(hostname -I)
MY_IP=192.168.25.19
MY_IP=192.168.25.16

echo "My IP Addr is $MY_IP"

#raspivid -t 0 -w 640 -h 480 -fps 15 -rot 90 -hf -b 2000000 -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=$MY_IP port=8160
  # gst-launch-1.0 -v tcpclientsrc host=$MY_IP port=8160 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false
  #------ Failure
  #cam_id = 'tcpclientsrc host=$MY_IP port=8160 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false'

#raspivid -o - -t 0 -hf -w 640 -h 480 -fps 10 | cvlc -vvv stream:///dev/stdin --sout '#standard{access=http,mux=ts,dst=:8160}' :demux=h264
  #cam_id = 'http://192.168.25.19:8160"

#gst-launch-1.0 -v v4l2src device=/dev/video0 ! "image/jpeg, width=640, height=480, framerate=30/1" ! rtpjpegpay ! udpsink host=$MY_IP port=8160
  #------ Failure
  #cam_id = 'udpsrc port=8160 ! application/x-rtp, encoding-name=JPEG, payload=26 ! rtpjpegdepay ! jpegdec ! autovideosink sync=false'


#------------------------------------
# Install gstremaer
#   Linux
#       sudo apt-get install gstreamer1.0 gstreamer1.0-tools
#   OSX
#       brew install gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav

# RPI (Sender)
#raspivid -t 0 -w 640 -h 480 -fps 15 -rot 90 -hf -b 2000000 -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=$MY_IP port=5000

# Linux/OSX (Sender)
#gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! autovideosrc ! video/x-raw, width=640, height=480 ! gdppay ! tcpserversink host=$MY_IP port=8160
gst-launch-1.0 autovideosrc ! video/x-raw, width=640, height=480 ! gdppay ! tcpserversink host=$MY_IP port=8160
#gst-launch-1.0 autovideosrc latency=0 ! decodebin ! tcpserversink host=$MY_IP port=8160

# Linux/OSX (Receiver)
#gst-launch-1.0 -v tcpclientsrc host=$MY_IP port=8160 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false
