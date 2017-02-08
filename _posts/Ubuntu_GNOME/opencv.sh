sudo apt install build-essential
sudo apt install cmake git pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libdc1394-22-dev
sudo apt install libgtk2.0-dev 
cp -r opencv-3.2.0 ~/Documents
cd ~/Documents/opencv-3.2.0
mkdir build && cd build
sudo apt install libprotobuf-c-dev 
sudo apt install libprotobuf-c1
cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules  -DBUILD_opencv_dnn=ON -DBUILD_EXAMPLES=ON -DBUILD_PNG=ON -DINSTALL_C_EXAMPLES=ON  -DWITH_OPENNI=ON -DWITH_OPENNI2=ON ..
#这里cuda的版本一定要支持系统gcc版本，只能高不能低，版本只能新不能老
#sudo subl /usr/local/cuda/include/host_config.h
# line: 115 comment out error
# //#error -- unsupported GNU version! gcc versions later than 4.9 are not supported! 
sudo make -j $(($(nproc) + 1))
sudo make install 
