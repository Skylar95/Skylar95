---
layout: post
title: Ubuntu CUDA+caffe+OpenCV+PCL+OpenNI+ROS+Matlab
date: 2017-2-9
categories: blog
tags: [UbuntuGnome]
description: Ubuntu setting tutorial
---

# 如何配置一个实用又装x的Ubuntu(三) CV相关配置

## CUDA
<br>前提是已经装好的nvidia的显卡驱动,我装的是nvidia-367
<br>去官网下载最新的[cuda](https://developer.nvidia.com/cuda-downloads) ,这里要注意如果你的系统,opencv都是最新的,cuda也要选最新的,不然会有一些包的版本不匹配

- 安装

```
	sh cuda_8.0.61_375.26_linux.run --override
```
<br>then put 's' still to 100% or 'PgDn','q'to quit description
<br>输入`accept`接受条款
<br>输入`n`不安装nvidia图像驱动，之前已经安装过了//此处一定要选择n
<br>输入`y`安装cuda 8.0工具
<br>回车确认cuda默认安装路径：/usr/local/cuda-8.0
<br>输入`y`用sudo权限运行安装，输入密码
<br>输入`y`或者n安装或者不安装指向/usr/local/cuda的符号链接
<br>输入`y`安装CUDA 8.0 Samples，以便后面测试
<br>回车确认CUDA 8.0 Samples默认安装路径：

- 添加路径

```
	echo "export CUDA_HOME=/usr/local/cuda-8.0 " >> ~/.zshrc
	echo "export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64:$LD_LIBRARY_PATH" >> ~/.zshrc
	echo "export PATH=/usr/local/cuda-8.0/bin:$PATH" >> ~/.zshrc
	source ~/.zshrc
```

- Test CUDA

```
	cd /usr/local/cuda-8.0/samples/1_Utilities/deviceQuery  
	sudo make -j4 
	sudo ./deviceQuery  
```

## Matlab

- 安装linux版本的Matlab及破解文件[link](http://www.linuxidc.com/Linux/2015-11/125153.htm)

```
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
```
- 桌面图标

```
	sudo cp -r Matlab_Linux/ShortCut /usr/local/MATLAB/R2015b 
	sudo cp Matlab_Linux/ShortCut/Matlab_2015b.desktop /usr/share/applications/


```
- 整理一下

```
	sudo apt-get update  
	sudo apt-get upgrade  
	sudo apt-get install build-essential  
	sudo apt-get autoremove 
```

## ROS

```
	sudo sh -c '. /etc/lsb-release && echo "deb http://mirror.sysu.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
	sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
	sudo apt-get update
```
有些包的版本不对，要降级

```
	sudo apt-get install libssl-dev=1.0.2g-1ubuntu4.5 libssl1.0.0=1.0.2g-1ubuntu4.5
	sudo apt-get install libkrb5support0=1.13.2+dfsg-5 libkrb5-3=1.13.2+dfsg-5 libk5crypto3=1.13.2+dfsg-5 libgssapi-krb5-2=1.13.2+dfsg-5

```
正式安装

```
	sudo apt install ros-kinetic-desktop-full 
	apt-cache search ros-kinetic
	sudo rosdep init
	rosdep update
```
如果都没报错,否则重复 `rosdep update`

```
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
	sudo apt install ros-kinetic-openni2-launch
	sudo apt install ros-kinetic-openni-launch
```

## cudnn
<br>自己下载 [cudnn](https://developer.nvidia.com/rdp/cudnn-download)

```
	tar xvf cudnn*.tgz
	cd cuda
	sudo cp */*.h /usr/local/cuda/include/
	sudo cp */libcudnn* /usr/local/cuda/lib64/
	sudo chmod a+r /usr/local/cuda/lib64/libcudnn*
```

## Tensorflow

```
	sudo apt-get install python-pip python-dev 
	sudo apt install libcudart7.5
	sudo pip install six --upgrade --target="/usr/lib/python2.7/dist-packages"
	sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.8.0-cp27-none-linux_x86_64.whl
```

## OpenBlas

```
	mkdir ~/git
	cd ~/git
	git clone https://github.com/xianyi/OpenBLAS.git
	cd OpenBLAS 
	sudo apt-get install gfortran
	make FC=gfortran -j $(($(nproc) + 1))
	sudo make PREFIX=/usr/local install
	echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc

```

## caffe

```
	sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler
	sudo apt-get install --no-install-recommends libboost-all-dev
	sudo apt-get install python-skimage ipython python-pil python-h5py ipython python-gflags python-yaml
	sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev
```

```
	cd ~/git
	git clone https://github.com/BVLC/caffe.git
	cd caffe
	cp Makefile.config.example Makefile.config
	sed -i 's/# USE_CUDNN := 1/USE_CUDNN := 1/' Makefile.config
	sed -i 's/BLAS := atlas/BLAS := open/' Makefile.config
```

```
	sudo pip install  Cython
	sudo pip install  leveldb 
	sudo pip install  networkx 
	sudo pip install  pandas
	sudo pip install -r python/requirements.txt
```

```
	make all -j $(($(nproc) + 1))
```

>	if Caffe didn't see hdf5.h when compiling<br>
--- INCLUDE_DIRS := \$(PYTHON_INCLUDE) /usr/local/include<br>
+++ INCLUDE_DIRS := \$(PYTHON_INCLUDE) /usr/local/include /usr/include/hdf5/serial/<br>
and rename hdf5_hl and hdf5 to hdf5_serial_hl and hdf5_serial in the Makefile:
--- LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_hl hdf5<br>
+++ LIBRARIES += glog gflags protobuf boost_system boost_filesystem m hdf5_serial_hl hdf5_serial<br>
More about the bug fix [here](https://gist.github.com/wangruohui/679b05fcd1466bb0937f#fix-hdf5-naming-problem).<br>

```
	make test -j $(($(nproc) + 1))
	make runtest -j $(($(nproc) + 1))
	make pycaffe -j $(($(nproc) + 1))
```

## OpenNI+OpenNI2

- OpenNI
<br>自己点开下[OpenNI](https://github.com/OpenNI/OpenNI) [SensorKinect](https://github.com/PrimeSense/Sensor) [NITE1.5](http://www.openni.ru/openni-sdk/openni-sdk-history-2/)

```
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
```

- OpenNI2
<br>自己点开下[OpenNI2](http://github.com/occipital/OpenNI2) [lifreenet](https://github.com/OpenKinect/libfreenect) [NITE2.0](http://www.openni.ru/openni-sdk/openni-sdk-history-2/)

```
	sudo apt-get install -y g++ python libusb-1.0-0-dev freeglut3-dev doxygen graphviz
	sudo apt-get install libudev-dev
```
这里如果libudev-dev安装出错，换源，用aliyun,update,upgrade,再安装就行

```
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
```
然后就行了
![](https://github.com/reasonW/MyImage/blob/master/reasonW.github.io/_posts/2017-02-09-img/3_1.png?raw=true)

## OpenCV

```
sudo apt install cmake-gui
```

```
	sudo apt install build-essential
	sudo apt install cmake git pkg-config libavcodec-dev libavformat-dev libswscale-dev
	sudo apt install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng12-dev libtiff5-dev libjasper-dev libdc1394-22-dev
	sudo apt install libgtk2.0-dev 
	cp -r opencv-3.2.0 ~/Documents
	cd ~/Documents/opencv-3.2.0
	mkdir build && cd build
	sudo apt install libprotobuf-c-dev 
	sudo apt install libprotobuf-c1
```
```
	git clone https://github.com/opencv/opencv.git
	cd opencv
	git checkout 3.1.0
```
or

```
	git checkout 3.2.0
```

```
	git clone https://github.com/opencv/opencv_contrib.git
	cd opencv_contrib
	git checkout 3.1.0
```
or

```
	git checkout 3.2.0
```

```
	cmake -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib/modules  -DBUILD_opencv_dnn=ON -DBUILD_EXAMPLES=ON -DBUILD_PNG=ON -DINSTALL_C_EXAMPLES=ON  -DWITH_OPENNI=ON -DWITH_OPENNI2=ON ..
```
如果openni2没有编译上,就过一会儿再编译一次
这里cuda的版本一定要支持系统gcc版本，只能高不能低，版本只能新不能老,如果编译报错

```
sudo subl /usr/local/cuda/include/host_config.h
```
>line: 115 comment out error<br>
 //#error -- unsupported GNU version! gcc versions later than 4.9 are not supported! 

```
	sudo make -j $(($(nproc) + 1))
	sudo make install 

```

## PCL

```
	sudo apt install g++ cmake cmake-qt-gui  doxygen mpi-default-dev openmpi-bin openmpi-common  libflann1.8 libflann-dev libeigen3-dev libboost-all-dev libvtk6.2-qt libvtk6.2  libvtk5-dev  libqhull*  libusb-dev libgtest-dev build-essential libxmu-dev libxi-dev libusb-1.0-0-dev graphviz mono-complete phonon-backend-gstreamer  phonon-backend-vlc  libvtk-java python-vtk6
	sudo apt install  git-core freeglut3-dev pkg-config
	cp -r pcl ~/Documents
	cd ~/Documents/pcl 
	mkdir build
	cd build
	cmake -DBUILD_CUDA=ON -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON -DWITH_OPENNI=ON -DWITH_OPENNI2=ON  -DBUILD_cuda_io=ON -DBUILD_cuda_apps=ON -DBUILD_gpu_tracking=ON -DBUILD_gpu_surface=ON ..
	sudo make -j $(($(nproc) + 1))
	sudo make install
```
如果openni2没有编译上,就先安装,过一会儿重启再重启再编译安装一次,一般就有了

## NOTES

**我从14版本升到16版本以后,编译以前的视觉包一直报一个libmpi的错,后来才知道是系统的动态链接库管理ld因升级有了变化，主要表现为依赖的包再次依赖不会自动展开，报一个很烦人的错误**

```
	undefined reference to symbol '_ZN3MPI8Datatype4FreeEv'
	usr/lib/libmpi_cxx.so.1: error adding symbols: DSO missing from command line
```

**知道了原因就好办了,编译的时候加上mpi链接就行,CMakeLists.txt里面加上**

> SET(CMAKE_C_COMPILER mpicc)<br>
SET(CMAKE_CXX_COMPILER mpicxx)<br>
include_directories(MPI_INCLUDE_PATH)<br>
target_link_libraries(mytest ${MPI_LIBRARIES})

