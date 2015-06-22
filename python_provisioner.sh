#!/bin/bash -x

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

module load python/2.7.10
curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | /opt/Python-2.7.10/bin/python2.7

/opt/Python-2.7.10/bin/easy_install pip
pip2.7 install --upgrade pip

pip2.7 install cython
pip2.7 install ipython
pip2.7 install virtualenv
pip2.7 install numpy
pip2.7 install pandas
pip2.7 install awscli

## Synapse Python client (only for python 2)
## Fixes an InsecurePlatformWarning
module unload python
yum -y remove python-openssl
yum -y install libffi-devel libssl-devel
module load python/2.7.10

pip2.7 install pyopenssl==0.15.1 ndg-httpsclient pyasn1
pip2.7 install synapseclient

module unload python

# Install python 3
# Can use a module file
wget https://www.python.org/ftp/python/3.4.3/Python-3.4.3.tgz
tar xzf Python-3.4.3.tgz
cd Python-3.4.3
mkdir /opt/Python-3.4.3/
./configure --prefix=/opt/Python-3.4.3/ --enable-unicode=ucs4 --enable-shared LDFLAGS="-Wl,-rpath /usr/local/lib" && \
    make && make altinstall

cd ..

module load python/3.4.3
curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python3.4

easy_install-3.4 pip
pip3.4 install --upgrade pip

pip3.4 install cython
pip3.4 install ipython
pip3.4 install virtualenv
pip3.4 install snakemake
pip3.4 install numpy
pip3.4 install pandas
pip3.4 install awscli

module unload python

## Cleanup
