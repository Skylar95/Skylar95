sudo apt install g++ cmake cmake-qt-gui  doxygen mpi-default-dev openmpi-bin openmpi-common  libflann1.8 libflann-dev libeigen3-dev libboost-all-dev libvtk6.2-qt libvtk6.2  libvtk5-dev  libqhull*  libusb-dev libgtest-dev build-essential libxmu-dev libxi-dev libusb-1.0-0-dev graphviz mono-complete phonon-backend-gstreamer  phonon-backend-vlc  libvtk-java python-vtk6
sudo apt install  git-core freeglut3-dev pkg-config
cp -r pcl ~/Documents
cd ~/Documents/pcl 
mkdir build
cd build
cmake -DBUILD_CUDA=ON -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON -DWITH_OPENNI=ON -DWITH_OPENNI2=ON  -DBUILD_cuda_io=ON -DBUILD_cuda_apps=ON -DBUILD_gpu_tracking=ON -DBUILD_gpu_surface=ON ..
sudo make -j $(($(nproc) + 1))
sudo make install
