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


# copy .bashrc from host to target /root directory
ADD .bashrc /root



RUN     apt-get update && \
        apt-get upgrade -y && \
	apt-get install -y --no-install-recommends build-essential cmake git pkg-config && \
	apt-get install -y libgstreamer-plugins-base1.0-dev libdc1394-22-dev  vim && \
	pip3 install numpy && \
	apt-get install -y vim wget


# pyaudio
RUN	apt-get install -y libasound-dev portaudio19-dev libportaudio2 libportaudiocpp0
RUN	apt-get install -y vlc
RUN	sed -i 's/geteuid/getppid/' /usr/bin/vlc

ADD	requirements_linux.txt /root
RUN	pip3 install -r /root/requirements_linux.txt

# Google Speech
ADD	application_default_credentials.json /root
RUN	mkdir -p ~/.config/gcloud
RUN	cp /root/application_default_credentials.json ~/.config/gcloud
RUN	export GOOGLE_APPLICATION_CREDENTIALS=~/.config/gcloud/application_default_credentials.json
RUN	chown -R $(whoami) ~/.config/gcloud/application_default_credentials.json

# mongodb
RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN	echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN	apt-get update &&\
	apt-get install -y mongodb-org

ENV	MONGO_DATA_DIR=/data/db
ENV	MONGO_LOG_DIR=/dev/null
#RUN	service mongod start

# setup environment variables?
#ENV DISPLAY :0


# Audio
#RUN	usermod -a -G audio root

# For ifconfig
RUN	apt-get install -y net-tools

# generate /root/work directory
COPY	. /root/docker
WORKDIR	/root/docker

CMD	./launch.sh


#ENTRYPOINT ["service","mongodb","start"]
#CMD /bin/bash
