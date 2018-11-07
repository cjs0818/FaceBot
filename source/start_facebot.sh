#!/bin/bash

cd $FACEBOT_HOME_ABS
source venv/bin/activate
cd $FACEBOT_HOME_ABS/Behavior_Expression/Act_Face
python3 main_server.py &

cd $FACEBOT_HOME_ABS
source venv/bin/activate
python3 main.py 0 &

