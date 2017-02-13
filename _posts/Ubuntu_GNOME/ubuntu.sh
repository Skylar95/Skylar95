sudo dpkg -i mentohust_0.3.4-1_amd64.deb
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update 
sudo apt-get install google-chrome-stable
# -- chrome://net-internals/#hsts
# Domain:
# > google.com  
# google.com.hk
# googleusercontent.com
# googleapis.com


sudo apt remove firefox libreoffice-*
sudo dpkg -i wps-office_10.1.0.5672~a21_amd64.deb
sudo dpkg -i sogoupinyin_2.1.0.0082_amd64.deb 
sudo apt install -f
sudo dpkg -i uget_2.0.8-0ubuntu0~trusty_amd64.deb
sudo dpkg -i aria2_1.18.1-1_amd64.deb
sudo apt install -f
sudo dpkg -i sublime-text_build-3126_amd64.deb
sudo apt install zsh
sudo cp hosts /etc
cp Sublime/Default.sublime-package /home/reasonw/.config/sublime-text-3/Installed\ Packages
cp Sublime/Package\ Control.sublime-package /home/reasonw/.config/sublime-text-3/Installed\ Packages
cp Sublime/SublimeClang-1.0.41.sublime-package /home/reasonw/.config/sublime-text-3/Installed\ Packages
sudo apt install libglib2.0-bin=2.48.1-1~ubuntu16.04.1 libglib2.0-0=2.48.1-1~ubuntu16.04.1 
sudo apt install libgtk2.0-dev
cd Sublime
gcc -shared -o libsublime-imfix.so sublime-imfix.c  `pkg-config --libs --cflags gtk+-2.0` -fPIC
sudo cp libsublime-imfix.so /opt/sublime_text/libsublime-imfix.so
sudo gedit /usr/bin/subl
# //sunl文件内容
# !/bin/sh
# LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text "$@"
sudo gedit /usr/share/applications/sublime_text.desktop
# 将[Desktop Entry]中的字符串
# Exec=/opt/sublime_text/sublime_text %F
# 修改为
# Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text %F"
# 将[Desktop Action Window]中的字符串
# Exec=/opt/sublime_text/sublime_text -n
# 修改为
# Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text -n"
# 将[Desktop Action Document]中的字符串
# Exec=/opt/sublime_text/sublime_text --command new_file
# 修改为
# Exec=bash -c "LD_PRELOAD=/opt/sublime_text/libsublime-imfix.so exec /opt/sublime_text/sublime_text --command new_file"
# Sublime Text > Preferences > Package Settings > OmniMarkupPreviewer > Settings - User
# paste the following to remove the strikeout package.

# {
#     "renderer_options-MarkdownRenderer": {
#         "extensions": ["tables", "fenced_code", "codehilite"]
#     }
# }

sudo apt-get remove unity-webapps-common
sudo apt-get remove libreoffice-common
sudo apt remove evolution
sudo apt-get remove thunderbird totem rhythmbox empathy brasero simple-scan gnome-mahjongg aisleriot
sudo apt remove transmission-common  gnome-sudoku deja-dup gnome-orca
sudo apt install  qml-module-ubuntu-web=0.23+16.04.20160413-0ubuntu1 --reinstall
sudo apt-get install unity-tweak-tool
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo apt-get update
sudo apt-get install simplescreenrecorder
sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update
sudo apt-get install indicator-multiload
sudo add-apt-repository ppa:noobslab/icons
sudo apt-get update
sudo apt-get install ultra-flat-icons-orange
sudo cp themes/Xenlism-Minimalism/ /usr/share/themes/
 

#sudo add-apt-repository ppa:hanipouspilot/rtlwifi
#sudo apt-get update
#sudo apt-get install rtlwifi-new-dkms linux-firmware
sudo apt install bcmwl-kernel-source
sudo apt install blueman  bluez bluez-cups bluez-obexd bluetooth bluez-btsco bluez-hcidump bluez-tools 
sudo apt-get install pulseaudio-module-bluetooth
sudo cp BCM.hcd /lib/firmware/brcm/

sudo mv  Franz-linux-x64-4.0.4 /opt/franz
wget "https://cdn-images-1.medium.com/max/360/1*v86tTomtFZIdqzMNpvwIZw.png" -O franz-icon.png
sudo cp franz-icon.png /opt/franz
sudo cp /opt/franz/franz.desktop /usr/share/applications/franz.desktop

# cuda,最好还是去官网下最新的cuda
sh cuda_8.0.44_linux.run --override
# then put 's' still to 100% or 'PgDn','q'to quit description
# 输入accept接受条款
# 输入n不安装nvidia图像驱动，之前已经安装过了//此处一定要选择n
# 输入y安装cuda 8.0工具
# 回车确认cuda默认安装路径：/usr/local/cuda-8.0
# 输入y用sudo权限运行安装，输入密码
# 输入y或者n安装或者不安装指向/usr/local/cuda的符号链接
# 输入y安装CUDA 8.0 Samples，以便后面测试
# 回车确认CUDA 8.0 Samples默认安装路径：
# add cuda path
echo "export CUDA_HOME=/usr/local/cuda-8.0 " >> ~/.zshrc
echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH" >> ~/.zshrc
echo "export PATH=/usr/local/cuda-8.0/bin:$PATH" >> ~/.zshrc
source ~/.zshrc
# test cuda
cd /usr/local/cuda-8.0/samples/1_Utilities/deviceQuery  
sudo make -j4 
sudo ./deviceQuery  

#Matlab
sudo mkdir /mnt/tmp
sudo mount -o loop R2015b_glnxa64.iso /mnt/tmp
cd /mnt/tmp
sudo ./install
sudo mkdir /usr/local/MATLAB/R2015b/licenses
cd /media/reasonw/661A1FD01A1F9C5D/Ubuntu/
sudo cp Matlab_Linux/Matlab\ 2015b\ Linux64\ Crack/license_standalone.lic /usr/local/MATLAB/R2015b/licenses
sudo cp -r Matlab_Linux/Matlab\ 2015b\ Linux64\ Crack/R2015b /usr/local/MATLAB/ 
sudo umount /mnt/tmp
sudo rm -r /mnt/tmp/
sudo cp -r Matlab_Linux/ShortCut /usr/local/MATLAB/R2015b 
sudo cp Matlab_Linux/ShortCut/Matlab_2015b.desktop /usr/share/applications/

sudo apt-get update  
sudo apt-get upgrade  
sudo apt-get install build-essential  
sudo apt-get autoremove 

# gnome-setting shell extension

#更新源
#ssl vpn nwpu java for chrome 
# sudo apt-get install default-jdk
# sudo add-apt-repository ppa:webupd8team/java
# sudo apt-get update
# sudo apt-get install oracle-java9-installer

#ROS 
sudo sh -c '. /etc/lsb-release && echo "deb http://mirror.sysu.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
#有些包的版本不对，要降级
sudo apt-get install libssl-dev=1.0.2g-1ubuntu4.5 libssl1.0.0=1.0.2g-1ubuntu4.5
sudo apt-get install libkrb5support0=1.13.2+dfsg-5 libkrb5-3=1.13.2+dfsg-5 libk5crypto3=1.13.2+dfsg-5 libgssapi-krb5-2=1.13.2+dfsg-5
#正式安装
sudo apt install ros-kinetic-desktop-full 
apt-cache search ros-kinetic
sudo rosdep init
rosdep update
#如果没报错
echo "source /opt/ros/kinetic/setup.zsh" >> ~/.zshrc
source ~/.zshrc
sudo apt-get install python-rosinstall
mkdir catkin_ws
cd catkin_ws 
mkdir src
cd src
catkin_init_workspace
cd ..
catkin_make

# download cudnnV5.1.tar.gz
#cudnn
cd Ubuntu/DLtool/
tar xvf cudnn*.tgz
cd cuda
sudo cp */*.h /usr/local/cuda/include/
sudo cp */libcudnn* /usr/local/cuda/lib64/
sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
# Tensorflow
sudo apt-get install python-pip python-dev 
sudo apt install libcudart7.5
sudo pip install six --upgrade --target="/usr/lib/python2.7/dist-packages"
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl
#OpenBlas
mkdir ~/git
cd ~/git
git clone https://github.com/xianyi/OpenBLAS.git
cd OpenBLAS 
sudo apt-get install gfortran
make FC=gfortran -j $(($(nproc) + 1))
sudo make PREFIX=/usr/local install
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
#caffe 
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
sudo apt-get install --no-install-recommends libboost-all-dev
sudo apt-get install python-skimage ipython python-pil python-h5py ipython python-gflags python-yaml
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
cd ~/git
git clone https://github.com/BVLC/caffe.git
cd caffe
cp Makefile.config.example Makefile.config
sed -i 's/# USE_CUDNN := 1/USE_CUDNN := 1/' Makefile.config
sed -i 's/BLAS := atlas/BLAS := open/' Makefile.config
sudo pip install  Cython
sudo pip install  leveldb 
sudo pip install  networkx 
sudo pip install  pandas
sudo pip install -r python/requirements.txt
#Caffe didn't see hdf5.h when compiling
# --- INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include
# +++ INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/
# and rename hdf5_hl and hdf5 to hdf5_serial_hl and hdf5_serial in the Makefile:

# --- LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_hl hdf5
# +++ LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_serial_hl hdf5_serial
# More about the bug fix [here](https://gist.github.com/wangruohui/679b05fcd1466bb0937f#fix-hdf5-naming-problem).
make all -j $(($(nproc) + 1))

make test -j $(($(nproc) + 1))
make runtest -j $(($(nproc) + 1))
make pycaffe -j $(($(nproc) + 1))

#openni openni2 flann google-test haru

cd Ubuntu/xm_vision/
./PKG_Pre/Autorun1.sh
#opencv
sudo apt install cmake-gui
./opencv-(+contrib+ippcv)-master/opencv.sh

#pcl
./pcl1.8_install/pcl1.8_install.sh

sudo apt install ros-kinetic-openni2-camera 

#sublime clang 
cp -r Sublime/SublimeClang ~/.config/sublime-text-3/Packages
cd ~/.config/sublime-text-3/Packages/SublimeClang
git pull && git submodule foreach --recursive git pull origin master
sudo apt-get install libclang-3.8
ldconfig -p | grep clang
cp /usr/lib/x86_64-linux-gnu/libclang-3.8.so ~/.config/sublime-text-3/Packages/SublimeClang/internals/libclang.so
cd src
mkdir build
cd build
cmake ..
make

#最后有个特别感慨的问题，以前升级到16版之后，我的这个机器人的包老是编译报错
#mpi的问题，但一直不知道咋解决，因为在14版上没出过错。今天弄明白了，是因为系统的动态链接库管理ld因为升级有了变化
# 主要表现为一来的包再次以来不会自动展开，还会报一个烦人的错误
# undefined reference to symbol '_ZN3MPI8Datatype4FreeEv'
#解决办法是在cmake里面做相应的增加

# SET(CMAKE_C_COMPILER mpicc)
# SET(CMAKE_CXX_COMPILER mpicxx)
# target_link_libraries(mytest ${MPI_LIBRARIES})

