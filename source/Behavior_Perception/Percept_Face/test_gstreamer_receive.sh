# Install gstremaer
#   Linux
#	sudo apt-get install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
#   OSX
#	brew install gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav

# RPI (Sender)
# raspivid -t 0 -w 640 -h 480 -fps 15 -rot 90 -hf -b 2000000 -o - | gst-launch-1.0 -v fdsrc ! h264parse ! rtph264pay config-interval=1 pt=96 ! gdppay ! tcpserversink host=192.168.25.19 port=5000

# Linux/OSX (Receiver)
gst-launch-1.0 -v tcpclientsrc host=192.168.25.19 port=8160 ! gdpdepay ! rtph264depay ! avdec_h264 ! videoconvert ! autovideosink sync=false
