# Install gstremaer
#   Linux
#	sudo apt-get install gstreamer1.0 gstreamer1.0-tools
#   OSX
#	brew install gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav

# RPI (Sender)
# raspivid -t 0 -w 640 -h 480 -fps 15 -rot 90 -hf -b 2000000 -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=192.168.25.19 port=5000

# Linux/OSX (Receiver)
gst-launch-1.0 -v tcpclientsrc host=192.168.25.19 port=8160 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false
