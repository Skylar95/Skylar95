cd OpenNI-Sensor_install
sh ./openni_sensor_nite_install.sh
cd ../OpenNI2-Freenect-install
sh ./openni2_freenect_nite2_install.sh
#以上均核对过没错
cd ..
mkdir ~/Documents/utils
cp -r hdf5 ~/Documents/utils
cp -r googletest ~/Documents/utils
cp -r libharu ~/Documents/utils
cp -r flann ~/Documents/utils
cd ~/Documents/utils/libharu
sh ./install.sh
echo "export PATH=$PATH:$HOME/Documents/utils/hdf5" >> ~/.zshrc
source ~/.zshrc
cd ../googletest
sh ./install.sh
cd ../flann
sh ./install.sh
