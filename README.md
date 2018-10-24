# Face Detection, Head Pose Detection and Face Recognition with OpenCV(python)

## Install Docker (docker & docker-compose)

### OS X
- Install **Docker for Mac**
  Refer to [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)
  
- Install **docker-compose**
  docker-compose is included in Docker for Mac. You don't need to install docker-compose separately ([https://docs.docker.com/compose/install/#install-compose](https://docs.docker.com/compose/install/#install-compose)).
  
### Ubuntu
- Install **docker**
  Refer to [https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository](http://docs.docker.com/install/linux/docker-ce/ubuntu/#install-using-the-repository)

- Install **docker-compose**
  ```
  $ sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
  $ sudo chmod +x /usr/local/bin/docker-compose
  ```

### Things to do after docker install

- The scripts require root or sudo privileges to run. So, for convenience, you'd better add $USER to the docker group and reboot.
   ```
    $ sudo groupadd docker  # Maybe already exist
    $ sudo usermod -aG docker $USER
    $ sudo reboot
   ```

- Configure Docker to start on boot
  ```
    $ sudo systemctl enable docker
  ```
- Sign up for Docker (https://cloud.docker.com/) and login.
  ```
    $ docker login
  ```

## Download git source files
- Download git source files in you work directory
```
$ git clone https://github.com/cjs0818/FaceBot.git   # if you don't have git installed, then install with "sudo apt-get install git"
$ cd FaceBot  # Let's say this director is BASE_DIR
```

- Set PYTHONPATH environment variable
```
$ export BASE_DIR=<your_work_dir>/FaceBot/source   # For me, ~/work/ChatBot/FaceBot/soure
$ export PYTHONPATH=$BASE_DIR:$PYTHONPATH
```


## *FaceBot* using Docker

You can execute FaceBot using docker or docker-compose

### 1. docker-compose (recommended)
- If you want launch, in the same docker container, "main_server.py" located in *$BASE_DIR/Behavior_Expression/Act_Face* folder, then
   ```
   $ cd docker
   $ docker-compose -f docker-compose-3in1.yml up
   ```
- If you want to launch separately "main_server.py" located in *$BASE_DIR/Behavior_Expression/Act_Face* folder, then
   ```
   $ cd docker
   $ python3 $BASE_DIR/Behavior_Expression/Act_Face/main_server.py &
   $ docker-compose -f docker-compose-2in1.yml up
   ```

- When you want to stop the containers, just type Ctrl-C.

### 2. docker (mongodb from docker can't be connected to host: to be solved)
- Run **start.sh**, the docker run script file
   ```
   $ ./start.sh
   ```
- Run **launch.sh** which describes all procedures we need to start
   ```
   root@761e48b8cd85:~/docker# ./launch.sh
   ```

## Install MongoDB
### OS X
- Refer to [https://docs.mongodb.com/manual/tutorial/install-mongodb-enterprise-on-os-x/](https://docs.mongodb.com/manual/tutorial/install-mongodb-enterprise-on-os-x/)
- Install
  ```
  $ brew install mongodb.  # Install in OSX
  ```
- 서비스 시작
  ```
  $ brew services start mongodb.  # start mongodb
  ```
- 서비스 중지
  ```
  $ brew services stop mongodb  # stop mongodb
  ```
- 특정 폴더의 DB로 시작
  ```
  $ mongod —dbpath <path to data directory>   # ./data/db
  ```

### Linux
- Refer to [https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/](https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/)
- Install
  ```
  $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
  $ echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
  $ sudo apt-get update
  $ sudo apt-get install -y mongodb-org
  $ sudo service mongod start
  ```
- Run MongoDB
  ```
  $ mongo --host 127.0.0.1:27017
  ```

### Studio 3T (MongoDB GUI client)
- Refer to [https://robomongo.org/download](https://robomongo.org/download)



## Install Python, pyenv, virtualenv
- Install python3   (v3.6.5 is recommended, since v3.7 & above is not compatible with tensorflow yet)
	- Ref: [https://beomi.github.io/2016/12/28/HowToSetup-Virtualenv-VirtualenvWrapper/](https://beomi.github.io/2016/12/28/HowToSetup-Virtualenv-VirtualenvWrapper/)
	```
	$ brew install python3
	```
- Install pyenv (to manage several versions of python in one PC)
	- Ref: [https://jiyeonseo.github.io/2016/07/27/install-pyenv/](https://jiyeonseo.github.io/2016/07/27/install-pyenv/)

	- In macOS,
	```
	$ brew install readline xz
    
    $ brew install pyenv
	$ brew upgrade pyenv  # It may generate some error message like "pyenv 1.2.7 already installed", but you can neglect it.
	```
    - In Linux,
      - Ref: [https://github.com/pyenv/pyenv](https://github.com/pyenv/pyenv) 설치방법 참조
      ```
      $ sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
           libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \ 
	   xz-utils tk-dev libffi-dev liblzma-dev
      $ curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
      $ pyenv update
      ```
    
    - PATH 설정 (~/.bash_profile 또는 ~/.bashrc에 아래 내용 추가)
    ```
    export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
    ```
    - 설치할 수 있는 목록 확인
    ```
    $ pyenv install --list
    ```
    - 원하는 python 버전 설치 준비
    ```
    $ pyenv install 3.6.5
    ```
    - 설치 준비된 python 버전 확인
    ```
    $ pyenv versions
    ```
    - 원하는 python 버전으로 변환
    ```
    $ pyenv shell 3.6.5
    ```
    - 설치된 python 버전 확인
    ```
    $ python -V
    ```

- Install virtualenv
```
$ pip3 install virtualenv virtualenvwrapper
```



## Create virtualenv for FaceBot

- Move to the BASE_DIR
```
$ cd $BASE_DIR
```

- Create virtualenv
```
$ virtualenv -p python3 venv   # <-- virtual env -p <python version> <가상 environment name
```
```
 $ virtualenv -p python3 venv   # Make sure you are using python 3.6.5
```
  - If you have already had venv with different version of python3 (i.e, python3.7.0), then you first need to remove the virtualenv folder (venv) and recreate a new venv with python3.6.5 



- Go into the virtualenv
```
$ source venv/bin/activate
```
	- When you exit the virtualenv, just type `deactivate` in the environment.
	```
    $ (venv) deactivate
    ```
- Install the required modules which are written in `requirements.txt.` file. (**It takes some time!!!**)
```
$ pip3 install -r requirements.txt
```

- Note, **tensorflow is not compatible with python3.7**.
  - Then, you should use python 3.6.5 (it can be easily switched using pyenv which is already described above)
  ```
  $ pyenv shell 3.6.5
  ```
  - You need to install the fixed custom builds of tensorflow whose version is fit to your system from [https://github.com/lakshayg/tensorflow-build](https://github.com/lakshayg/tensorflow-build)
  ```
  $ pip3 install --ignore-installed --upgrade /path/to/binary.whl
  ```
  For my system, (python 3.6.5 and tensorflow 1.9.0)
  ```
  $ pip3 install --ignore-installed --upgrade tensorflow-1.9.0-cp36-cp36m-macosx_10_13_x86_64.whl
  ```

- If you do not have **Cmake** installed, install it first to use **Dlib** module.
    - If ```$ sudo apt-get install cmake``` works, that's it. Otherwise,
    - Download the compressed Cmake software from [https://cmake.org/download/](https://cmake.org/download/)
      - [https://cmake.org/files/v3.12/cmake-3.12.2.tar.gz](https://cmake.org/files/v3.12/cmake-3.12.2.tar.gz)
    - Uncompress the downloaded file
    - Move inside the uncompressed folder (cmake-3.12.2)
    - Install Cmake as follows (**Note: It takes some time!**)
  ```
  $ ./bootstrap && make && make install
  ```
  

## Install OpenCV(python)

- Install opencv-python ([https://pypi.org/project/opencv-python/](https://pypi.org/project/opencv-python/))
```
$ pip3 install opencv-contrib-python # if you need both main and contrib modules (recommended)
$ pip3 install opencv-python  # if you need only main modules
```

- Reference for opencv stuffs: [https://opencv-python.readthedocs.io/en/latest/index.html](https://opencv-python.readthedocs.io/en/latest/index.html)

### Sample codes
- Camera Test: camera_test.py

```
# -*-coding: utf-8 -*-
import cv2

# cap 이 정상적으로 open이 되었는지 확인하기 위해서 cap.isOpen() 으로 확인가능
cap = cv2.VideoCapture(0)

# cap.get(prodId)/cap.set(propId, value)을 통해서 속성 변경이 가능.
# 3은 width, 4는 heigh

print('width: {0}, height: {1}'.format(cap.get(3),cap.get(4)))

cap.set(3,320)
cap.set(4,240)

while(True):
    # ret : frame capture결과(boolean)
    # frame : Capture한 frame
    ret, frame = cap.read()

    if (ret):
        # image를 Grayscale로 Convert함.
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        #cv2.imshow('frame', gray)
        cv2.imshow('frame', frame)
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

cap.release()
cv2.destroyAllWindows()
```

## Install large model data
### For Head Pose Detection (Dlib)
 - Download a trained facial shape predictor from:
 	- [http://sourceforge.net/projects/dclib/files/dlib/v18.10/shape_predictor_68_face_landmarks.dat.bz2](http://sourceforge.net/projects/dclib/files/dlib/v18.10/shape_predictor_68_face_landmarks.dat.bz2)
### For Face Recognition (Dlib)
 - Da trained facial shape predictor and recognition model from:
 	- [http://dlib.net/files/shape_predictor_5_face_landmarks.dat.bz2](http://dlib.net/files/shape_predictor_5_face_landmarks.dat.bz2)
 	- [http://dlib.net/files/dlib_face_recognition_resnet_model_v1.dat.bz2](http://dlib.net/files/dlib_face_recognition_resnet_model_v1.dat.bz2/)
