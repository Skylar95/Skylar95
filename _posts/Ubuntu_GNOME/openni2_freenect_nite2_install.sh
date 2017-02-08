sudo apt-get install -y g++ python libusb-1.0-0-dev freeglut3-dev doxygen graphviz
sudo apt-get install libudev-dev
#这里如果libudev-dev安装出错，换源，用aliyun,update,upgrade,再安装就行
sudo apt-get install cmake pkg-config build-essential libxmu-dev libxi-dev
cp -r openni2 ~/Documents/
cd ~/Documents/openni2/OpenNI2
make
cd Bin/x64-Release
sudo cp libOpenNI2.jni.so libOpenNI2.so /usr/lib
sudo cp -r OpenNI2 /usr/lib
cd ../../../libfreenect
mkdir build
cd build
cmake ..
make
sudo make install
cmake .. -DBUILD_OPENNI2_DRIVER=ON
make
sudo make install
sudo ldconfig /usr/local/lib/
cd ../../NiTE-2.0.0
sh ./install.sh
cd Redist
sudo cp libNiTE2.so NiTE.ini /usr/local/lib
sudo cp -r NiTE2 /usr/local/lib
echo "export NITE2_INCLUDE=$HOME/Documents/openni2/NiTE-2.0.0/Include" >> ~/.zshrc
echo "export NITE2_REDIST64=$HOME/Documents/openni2/NiTE-2.0.0/Redist" >> ~/.zshrc

