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
#FROM messa/circleci-python-with-mongodb:3.6
#--------------------


# install vim
#RUN apt-get update && apt-get install -y \
#    vim \
#    wget \
#    x11-apps \
#    && rm -rf /var/lib/apt/lists/*

# generate /root/work directory
#WORKDIR /root/work

# copy .bashrc from host to target /root directory
ADD	.bashrc /root
ADD	launch.sh /root

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
#RUN	apt-get install -y apt-transport-https
#RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
#	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list && \
#	apt-get update && \
#	apt-get install -y mongodb-org && \   #### Error
RUN	apt-get install -y mongodb
RUN	service mongodb start
# Run Mongo DB
#RUN	mongo --host 127.0.0.1:27017


# pyaudio
RUN	apt-get install -y libasound-dev portaudio19-dev libportaudio2 libportaudiocpp0
RUN	apt-get install -y vlc
RUN	sed -i 's/geteuid/getppid/' /usr/bin/vlc

ADD	requirements_linux.txt /root
RUN	pip3 install -r /root/requirements_linux.txt


# Google Cloud SDK
#RUN	apt-get install -y lsb-release
#RUN	export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
#RUN	echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
#RUN	curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
#RUN	apt-get update
#RUN	apt-get install -y google-cloud-sdk

#RUN	gcloud init
#RUN	gcloud iam service-accounts keys create ~/jschoi_gcloud_service_accounts_key.json --iam-account jschoi@chatbot-215901.iam.gserviceaccount.com
#RUN	gcloud auth application-default login
ADD	application_default_credentials.json /root
RUN	mkdir -p ~/.config/gcloud
RUN	cp /root/application_default_credentials.json ~/.config/gcloud
RUN	export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
RUN	chown -R $(whoami) ~/.config/gcloud/application_default_credentials.json


#ENTRYPOINT ["service","mongodb","start"]
#CMD /bin/bash


#RUN cd /root; git clone https://github.com/opencv/opencv; cd /root/opencv; mkdir build; cd build; cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..; make; make install
#-----------------

