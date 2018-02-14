yum update
yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel
read -p "Press enter to continue"
yum install gcc gcc-c++ make openssl-devel
read -p "Press enter to continue"
yum  groupinstall 'Development Tools'
yum install gcc openssl-devel bzip2-devel
_installdir="$(pwd)"
read -p "Press enter to continue"
cp Python-3.6.3.tgz /usr/src/
cd /usr/src
#wget https://www.python.org/ftp/python/3.6.3/Python-3.6.3.tgz
tar xzf Python-3.6.3.tgz
read -p "Press enter to continue"
cd Python-3.6.3
./configure --enable-optimizations
make altinstall
python3.6 -V
read -p "Press enter to continue"
#subscription-manager register --username --password --auto-attach
#yum groupinstall 'Server with GUI'
#yum groupinstall 'X Window System' 'GNOME'
#systemctl set-default graphical.target
#yum install https://centos7.iuscommunity.org/ius-release.rpm
yum install python36u
read -p "Press enter to continue"
yum -y install python34-setuptools
yum -y install python36u-pip
read -p "Press enter to continue"
sudo yum install python36u-pip
sudo yum install python36u-devel
sudo pip3.6 install numpy
read -p "Press enter to continue"
pip3.6 install wheel
read -p "Press enter to continue"
yum install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy
read -p "Press enter to continue"
python3.6 -m pip install --user numpy scipy matplotlib ipython jupyter pandas sympy nose
cd $_installdir
read -p "Press enter to bazel"
./bazel-0.5.4-installer-linux-x86_64.sh
bazel
read -p "Press enter to bazel"
rpm -Uvh cuda-repo-rhel7-9-1-local-9.1.85-1.x86_64.rpm
yum install cuda
export PATH=/usr/local/cuda-9.1/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64
export LD_LIBRARY_PATH=/usr/local/cuda-9.1/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
nvcc --version
which nvcc
read -p "Press enter to cudnn"
tar -xvzf cudnn-9.1-linux-x64-v7.tgz
read -p "Press enter to cudnn"
sudo cp cuda/include/* /usr/local/cuda/include
sudo cp cuda/include/cudnn.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
#cp cuda/lib64/libcudnn*  /usr/local/cuda-9.1/lib64
read -p "Press enter to cudnn"
sudo chmod a+r /usr/local/cuda/include/cudnn.h
/usr/local/cuda/lib64/libcudnn*
export  DYLD_LIBRARY_PATH=/usr/local/cuda/lib64:$DYLD_LIBRARY_PATH
cat /usr/local/cuda/include/cudnn.h | grep CUDNN_MAJOR -A 2
nvcc --version
read -p "Press enter to cudnn"
ln -s /usr/local/cuda-9.1/targets/x86_64-linux/include/crt/math_functions.hpp /usr/local/cuda/include/math_functions.hpp
read -p "Press enter to tensorflow"
unzip tensorflow-1.4.0-rc0.zip
cd tensorflow-1.4.0-rc0
./configure
bazel build --config=opt //tensorflow/tools/pip_package:build_pip_package
read -p "Press enter to cudnn"
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg
read -p "Press enter to cudnn"
cd /usr/src
sudo pip3.6 install /tmp/tensorflow_pkg/
read -p "Press enter to cudnn"
python3.6
import tensorflow as tf
hello = tf.constant('Hello, TensorFlow!')
sess = tf.Session()
print(sess.run(hello))
