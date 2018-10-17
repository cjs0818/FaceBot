#########################
#	Util
#########################
alias so="source ~/.bashrc"
alias ll="ls -al"


#########################
# Docker
export DOCKER_ID_USER="pristine70"
DISPLAY_IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
#xhost +$DISPLAY_IP
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
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"

#alias venv="source venv/bin/activate"
#----------------------------

#---------------------------
# SetUp for jschoi's ChatBot
export PYTHONPATH=~/work/ChatBot/FaceBot/source:$PYTHONPATH
#-----------------------
# multiprocessing of playsound in Python
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES 
