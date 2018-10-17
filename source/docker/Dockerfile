#--------------------
# For CUDA
##FROM jschoi/yolo
#FROM nvidia/cuda
#RUN ls -al
#--------------------

#--------------------
# For RaspberryPi3
#FROM demosense/raspberrypi3-opencv
#--------------------

#--------------------
# For Ubuntu
FROM python:3.6
#--------------------


# install vim
#RUN apt-get update && apt-get install -y \
#    vim \
#    wget \
#    x11-apps \
#    && rm -rf /var/lib/apt/lists/*

# generate /root/work directory
WORKDIR /root/work

# copy .bashrc from host to target /root directory
ADD .bashrc /root

# setup environment variables?
#ENV DISPLAY :0


RUN     apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y --no-install-recommends build-essential cmake git pkg-config && \
	#apt-get install -y libtiff5-dev libjasper-dev libpng12-dev libgtk2.0-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libatlas-base-dev gfortran libavresample-dev libgphoto2-dev && \
	apt-get install -y libgstreamer-plugins-base1.0-dev libdc1394-22-dev  vim && \
        pip3 install numpy && \
	apt-get install -y vim wget



# pyenv
# mongodb
# Install MongoDB in Lunux
#RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
	#echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
	#apt-get update && \
	#apt-get install -y mongodb-org && \   #### Error
	#service mongod start
# Run Mongo DB
#RUN	mongo --host 127.0.0.1:27017

RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
#RUN	apt-get install -y mongodb-org


ADD	requirements_linux.txt /root
#RUN	pip3 install -r /root/requirements_linux.txt


CMD /bin/bash

#RUN cd /root; git clone https://github.com/opencv/opencv; cd /root/opencv; mkdir build; cd build; cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..; make; make install
#-----------------

