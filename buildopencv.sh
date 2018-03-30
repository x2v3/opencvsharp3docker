
apt-get update && apt-get install -y git wget cmake tree
mkdir opencv
cd /opencv
wget https://github.com/opencv/opencv/archive/3.4.1.tar.gz -O opencv.tar.gz
tar -zxvf opencv.tar.gz
mv opencv-3.4.1 opencv

wget https://github.com/opencv/opencv_contrib/archive/3.4.1.tar.gz -O opencv_contrib.tar.gz
tar -zxvf opencv_contrib.tar.gz
mv opencv_contrib-3.4.1 opencv_contrib

wget https://github.com/shimat/opencvsharp/archive/3.4.1.20180320.tar.gz -O opencvsharp.tar.gz
tar -zxvf opencvsharp.tar.gz
mv opencvsharp-3.4.1.20180320 opencvsharp
apt-get install --no-install-recommends -y libopencv-dev yasm libjpeg-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libv4l-dev python-dev python-numpy libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils pkg-config
apt-get install --no-install-recommends  -y curl build-essential checkinstall cmake unzip libunwind8 gettext wget git
# build opencv
cd /opencv/opencv 
mkdir build
cd /opencv/opencv/build
pwd
cmake -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -DWITH_OPENEXR=OFF -DBUILD_TIFF=OFF -DWITH_CUDA=OFF -DWITH_NVCUVID=OFF -DBUILD_PNG=OFF ../
make
make install
# configure
echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf
ldconfig


# build opencvsharp
cd /opencv/opencvsharp
mkdir build
cd /opencv/opencvsharp/build
cmake ../src
make 
make install

#cleaning
apt-get remove -y libopencv-dev yasm libjpeg-dev libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libv4l-dev python-dev libtbb-dev libqt4-dev libgtk2.0-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev
apt-get remove -y build-essential checkinstall cmake unzip
#apt-get autoremove -y
rm -rf /opencv
