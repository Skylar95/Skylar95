sudo apt-get install g++ python libusb-1.0-0-dev freeglut3-dev openjdk-8-jdk  doxygen graphviz
sudo apt-get install mono-complete
cp -r openni ~/Documents/
cd ~/Documents/openni/OpenNI
cd Platform/Linux/CreateRedist
chmod +x RedistMaker
./RedistMaker
cd ../Redist/OpenNI-Bin-Dev-Linux-x64-v1.5.4.0 
sudo  ./install.sh
# sudo chmod +x /usr/include/ni/Linux-x86/
# sudo chmod +x /usr/include/ni/Linux-Arm/
# sudo chmod +x /usr/include/ni/MacOSX/
cd ~/Documents/openni/SensorKinect
cd Platform/Linux/CreateRedist
chmod +x RedistMaker
./RedistMaker
cd ../Redist/Sensor-Bin-Linux-x64-v5.1.2.1
chmod +x install.sh
sudo ./install.sh
cd ~/Documents/openni/NITE-Bin-Dev-Linux-x64-v1.5.2.23
sudo sh ./install.sh
