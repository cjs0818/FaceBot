export FACEBOT_HOME=~/work/ChatBot/FaceBot/source

#-----------------------
# 2in1
#python3 $FACEBOT_HOME/Behavior_Expression/Act_Face/main_server.py &
#docker-compose -f docker-compose-2in1.yml up

#-----------------------
# 3in1
#docker-compose -f docker-compose-3in1.yml up

#-----------------------
# rasp
docker-compose -f docker-compose-rasp.yml up


#sudo chown -R $USER ~/work/ChatBot/FaceBot/source/Knowledge/Database/MongoDB
