#!/bin/bash -x

# Need this for module loading
source /etc/profile.d/modules.sh

cd /root/src/

yum makecache
yum install -y ed less wget
yum install -y python python-devel

# Install newer version of python 2
# Will require a module file
yum install -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel

wget https://www.python.org/ftp/python/2.7.10/Python-2.7.10.tgz
tar xzf Python-2.7.10.tgz
cd Python-2.7.10
mkdir /opt/Python-2.7.10/
./configure --prefix=/opt/Python-2.7.10/ --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && make && make altinstall
cd ..

ln -s /opt/Python-2.7.10/bin/python2.7 /opt/Python-2.7.10/bin/python

# Requires copying of the module file at beginning of provisioning
module load python/2.7.10

curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | /opt/Python-2.7.10/bin/python2.7

/opt/Python-2.7.10/bin/easy_install pip
pip2.7 install --upgrade pip

pip2.7 install cython

# Install numpy, using openblas
cd /root/src
pip2.7 install -d /root/src numpy
tar xzf numpy-*.tar.gz
cd numpy-*

# # files uploaded by file provisioner
# # configuration for openblas, which should be at /opt/OpenBLAS/
cp /home/ec2-user/numpy/site.cfg .

unset CPPFLAGS
unset LDFLAGS
python setup.py clean && python setup.py build --fcompiler=gnu95 && python setup.py install
# python setup.py clean && python setup.py build && python setup.py install

cd /root/src
rm -rf numpy-*

# Install scipy, using openblas
cd /root/src
pip2.7 install -d /root/src scipy
tar xzf scipy-*.tar.gz
cd scipy-*

# # files uploaded by file provisioner
# # configuration for openblas, which should be at /opt/OpenBLAS/
cp /home/ec2-user/numpy/site.cfg .

unset CPPFLAGS
unset LDFLAGS
python setup.py clean && python setup.py build --fcompiler=gnu95 && python setup.py install
# python setup.py clean && python setup.py build && python setup.py install

cd /root/src
rm -rf scipy*

## Need this to get the lib; should be in the python modulefile
# export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:$LD_LIBRARY_PATH

## For Synapse Python client, fixes an InsecurePlatformWarning
module unload python
# yum -y remove pyOpenSSL
yum -y install libffi-devel openssl-devel

module load python/2.7.10
pip2.7 install -r /home/ec2-user/python_requirements.txt
pip2.7 install synapseclient
module unload python/2.7.10

# Install python 3
# Can use a module file
wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
tar xzf Python-3.4.3.tgz
cd Python-3.4.3
mkdir /opt/Python-3.4.3/
./configure --prefix=/opt/Python-3.4.3/ --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && \
    make && make altinstall

cd ..

ln -s /opt/Python-3.4.3/bin/python3.4 /opt/Python-3.4.3/bin/python

# Requires copying of the module file at beginning of provisioning
module load python/3.4.3

curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python3.4

easy_install-3.4 pip
pip3.4 install --upgrade pip

pip3.4 install cython

# Install numpy, using openblas
cd /root/src
pip3.4 install -d /root/src numpy
tar xzf numpy-*.tar.gz
cd numpy-*

cp /home/ec2-user/numpy/site.cfg .

unset CPPFLAGS
unset LDFLAGS
python setup.py clean && python setup.py build --fcompiler=gnu95 && python setup.py install
# python setup.py clean && python setup.py build && python setup.py install

cd /root/src
rm -rf numpy*

# Install scipy, using openblas
cd /root/src
pip3.4 install -d /root/src scipy
tar xzf scipy-*.tar.gz
cd scipy-*

# # files uploaded by file provisioner
# # configuration for openblas, which should be at /opt/OpenBLAS/
cp /home/ec2-user/numpy/site.cfg .

unset CPPFLAGS
unset LDFLAGS
python setup.py clean && python setup.py build --fcompiler=gnu95 && python setup.py install
# python setup.py clean && python setup.py build && python setup.py install

cd /root/src
rm -rf scipy*

pip3.4 install -r /home/ec2-user/python_requirements.txt

module unload python

## Cleanup
