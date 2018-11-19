#-----------------------------------
# Utils
alias so="source ~/.bashrc"
alias ll="ls -al"
export PATH=/usr/loca/bin:$PATH


#-----------------------------------
# RoS
source /opt/ros/kinetic/setup.bash


#########################
# Docker
export DOCKER_ID_USER="pristine70"
#DISPLAY_IP=$(ifconfig eth0 | grep inet | awk '$1=="inet" {print $2}')
#xhost +$DISPLAY_IP
#xhost +
export LIBGL_ALWAYS_INDIRECT=1
#########################


#------------------------
# Google Cloud

# google-cloud-vision
export GOOGLE_PROJECT=chatbot-215901
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json"
#------------------------

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/work/GoogleCloudSDK/google-cloud-sdk/path.bash.inc' ]; then source '~/work/GoogleCloudSDK/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/work/GoogleCloudSDK/google-cloud-sdk/completion.bash.inc' ]; then source '~/work/GoogleCloudSDK/google-cloud-sdk/completion.bash.inc'; fi

#----------------------------
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv shell 3.6.5

export PYTHONPATH=`pyenv prefix`/lib/python3.6/site-packages:$PYTHONPATH

alias venv="source venv/bin/activate"
#----------------------------


#-----------------------
# multiprocessing of playsound in Python
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

#-----------------------


#-----------------------
# FACEBOT
export FACEBOT_HOME="~/work/ChatBot/FaceBot/source"
alias facebot="cd $FACEBOT_HOME"
alias facebot1="cd $FACEBOT_HOME; venv; cd $FACEBOT_HOME/Behavior_Expression/Act_Face; python3 main_server.py"
alias facebot2="cd $FACEBOT_HOME; venv; python3 main.py 0"

#---------------------------
# SetUp for jschoi's ChatBot
export PYTHONPATH=$FACEBOT_HOME:$PYTHONPATH
export PYTHONPATH=$FACEBOT_HOME/venv/lib/python3.6/site-packages:$PYTHONPATH

#-----------------------
# MongoDB
#export MONGO_DATA_DIR=/data/db
export MONGO_DATA_DIR=$FACEBOT_HOME/Knowledge/Database/MongoDB
export MONGO_LOG_DIR=/dev/null
alias facebot0="mongod --dbpath $MONGO_DATA_DIR"

#-----------------------
# Launch once facebot0, 1, 2
export FACEBOT_HOME_ABS="/home/jschoi/work/ChatBot/FaceBot/source"
#if [ -f $FACEBOT_HOME_ABS/.log ]
#  then
#    bash $FACEBOT_HOME_ABS/.log
#fi

