# If OS is OSX then,
# you should do the following first in the other terminal
# socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"

OS=OSX
#OS=Linux

GPU=0
#GPU=1


#-------------
XSOCK=/tmp/.X11-unix
#XAUTH=/tmp/.docker.xauth
#xauth nlist :0 | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
#-------------

#IMAGE_ID=pristine70/python3.6_opencv
#NAME_ID=pristine70_python3.6_opencv
IMAGE_ID=osrf/ros:kinetic-desktop-xenial
NAME_ID=ros-kinetic


#  nvidia-docker run -it --rm \

#--------------------------------
if [ $OS = "OSX" ]
then
  DOCKER=docker
  #EN0=en0
  EN0=en1
  DISPLAY_IP=$(ifconfig $EN0 | grep inet | awk '$1=="inet" {print $2}')
  XDISP=DISPLAY=$DISPLAY_IP:0  # for OSX
  WORKDIR=/Users/jschoi/work
else
  if [ $GPU = 1 ]
  then
    DOCKER=nvidia-docker  
  else
    DOCKER=docker
  fi
  EN0=enp0s5
  #EN0=enp0s31f6
  XDISP="DISPLAY"             # for Linux
  WORKDIR=/home/jschoi/work
fi

#    --env "DISPLAY" \
#    --env DISPLAY=$DISPLAY_IP:0 \
#--------------------------------

#xhost + $DISPLAY_IP
xhost +

$DOCKER run -it --rm \
    --env $XDISP \
    --env "QT_X11_NO_MITSHM=1" \
    --env LIBGL_ALWAYS_INDIRECT=1 \
    --volume $XSOCK:$XSOCK:ro \
    --volume $WORKDIR:/root/work:rw \
    --volume $WORKDIR/ChatBot/FaceBot/source/Knowledge/Database/MongoDB:/data/db \
    --name $NAME_ID \
    $IMAGE_ID \
    /bin/bash
#export containerId=$(docker ps -l -q)
#    -p 60000:60000 \
#    -p 27017:27017 \

#xhost +local:`docker inspect --format='{{ .Config.Hostname }}' $containerId`
#docker start $containerId
#docker attach $containerId
