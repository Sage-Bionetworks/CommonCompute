#!/bin/bash -x

# # Need this for module loading
# source /etc/profile.d/modules.sh

# Needed for path to R when installing rpy
# This is set for users except for root
export PATH=$PATH:/usr/local/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/python/lib

cd /root/src/

yum makecache
yum install -y ed less wget
yum install -y openjpeg openjpeg-devel openjpeg-libs libjpeg-turbo libjpeg-turbo-devel
yum install -y mesa-private-llvm mesa-private-llvm-devel
yum install -y libxml2 libxml2-devel libxslt libxslt-devel

## For Synapse Python client, fixes an InsecurePlatformWarning
# module unload python
# yum -y remove pyOpenSSL
yum -y install libffi-devel openssl-devel


# Install newer version of python 2
# Will require a module file
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

mkdir /opt/python/

wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar xzf Python-2.7.10.tgz
cd Python-2.7.10
# ./configure --prefix=/opt/Python-2.7.10/ --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && make && make altinstall
./configure --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" --prefix /opt/python && make && make altinstall
cd ..

# ln -s /opt/Python-2.7.10/bin/python2.7 /opt/Python-2.7.10/bin/python

# # Requires copying of the module file at beginning of provisioning
# module load python/2.7.10
# curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | /opt/Python-2.7.10/bin/python2.7
curl https://bootstrap.pypa.io/get-pip.py | /opt/python/bin/python2.7

# # Install numpy, using openblas
# cd /root/src
# /opt/python/bin/pip2.7 install -d /root/src numpy==1.10.4
# tar xzf numpy-*.tar.gz
# cd numpy-*
#
# # # files uploaded by file provisioner
# # # configuration for openblas, which should be at /opt/OpenBLAS/
# cp /home/centos/numpy/site.cfg .
#
# unset CPPFLAGS
# unset LDFLAGS
# /opt/python/bin/python2.7 setup.py clean && /opt/python/bin/python2.7 setup.py build --fcompiler=gnu95 && /opt/python/bin/python2.7 setup.py install
# # python setup.py clean && python setup.py build && python setup.py install
#
# cd /root/src
# rm -rf numpy-*
#
# # Need this to get the lib; should be in the python modulefile
# export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:$LD_LIBRARY_PATH
#
# # Install scipy, using openblas
# cd /root/src
# /opt/python/bin/pip2.7 install -d /root/src scipy==0.17.0
# tar xzf scipy-*.tar.gz
# cd scipy-*
#
# # # files uploaded by file provisioner
# # # configuration for openblas, which should be at /opt/OpenBLAS/
# cp /home/centos/numpy/site.cfg .
#
# unset CPPFLAGS
# unset LDFLAGS
# /opt/python/bin/python2.7 setup.py clean && /opt/python/bin/python2.7 setup.py build --fcompiler=gnu95 && /opt/python/bin/python2.7 setup.py install
# # python setup.py clean && python setup.py build && python setup.py install
#
# cd /root/src
# rm -rf scipy*

/opt/python/bin/pip2.7 install numpy==1.10.4
/opt/python/bin/pip2.7 install scipy==0.17.0

/opt/python/bin/pip2.7 install -r /home/centos/python_requirements.txt

# # Install python 3
# # Can use a module file
# wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
# tar xzf Python-3.4.3.tgz
# cd Python-3.4.3
# ./configure --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && make && make altinstall

# cd ..

# # # Requires copying of the module file at beginning of provisioning
# # module load python/3.4.3

# curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | /usr/local/bin/python3.4

# /usr/local/bin/easy_install-3.4 pip
# /usr/local/bin/pip3.4 install --upgrade pip

# /usr/local/bin/pip3.4 install cython

# # Install numpy, using openblas
# cd /root/src
# /usr/local/bin/pip3.4 install -d /root/src numpy
# tar xzf numpy-*.tar.gz
# cd numpy-*

# cp /home/centos/numpy/site.cfg .

# unset CPPFLAGS
# unset LDFLAGS
# /usr/local/bin/python3.4 setup.py clean && /usr/local/bin/python3.4 setup.py build --fcompiler=gnu95 && /usr/local/bin/python3.4 setup.py install

# cd /root/src
# rm -rf numpy*

# # Install scipy, using openblas
# cd /root/src
# /usr/local/bin/pip3.4 install -d /root/src scipy
# tar xzf scipy-*.tar.gz
# cd scipy-*

# # # files uploaded by file provisioner
# # # configuration for openblas, which should be at /opt/OpenBLAS/
# cp /home/centos/numpy/site.cfg .

# unset CPPFLAGS
# unset LDFLAGS
# /usr/local/bin/python3.4 setup.py clean && /usr/local/bin/python3.4 setup.py build --fcompiler=gnu95 && /usr/local/bin/python3.4 setup.py install
# # python setup.py clean && python setup.py build && python setup.py install

# pip3.4 install -r /home/centos/python3_requirements.txt

# module unload python

## Cleanup
