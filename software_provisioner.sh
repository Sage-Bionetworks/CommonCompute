#!/bin/bash -x

# Provisioner for software

mkdir /root/src/
cd /root/src/

yum remove -y R-core R-core-devel R-java R-java-devel
# yum update -y
yum install -y curl libcurl libcurl-devel readline readline-devel readline-static

# wget "http://downloads.sourceforge.net/project/modules/Modules/modules-3.2.10/modules-3.2.10.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fmodules%2Ffiles%2F&ts=1433366084&use_mirror=iweb" -O modules-3.2.10.tar.gz
# tar xzf modules-3.2.10.tar.gz
# cd modules-3.2.10/
# ./configure && make && make install
# cd -

# ## For Sailfish
# # This needs the module file at modulefiles/Sailfish/0.6.3
# cd /opt/
# wget "https://github.com/kingsfordgroup/sailfish/releases/download/v0.6.3/Sailfish-0.6.3-Linux_x86-64.tar.gz" -O Sailfish-0.6.3-Linux_x86-64.tar.gz
# tar -xzf Sailfish-0.6.3-Linux_x86-64.tar.gz
# cd -

# # Copy pre-made module files - these were moved to the instance at the beginning
# # of the provision
# cp -R /home/centos/modulefiles/* /usr/share/Modules/modulefiles/

# OpenBlas
mkdir /root/src/OpenBlas
cd /root/src/OpenBlas
wget http://github.com/xianyi/OpenBLAS/archive/v0.2.14.tar.gz
tar xzf v0.2.14.tar.gz
cd OpenBLAS-0.2.14/
make BINARY=64 FC=gfortran USE_THREAD=1 && make install

cd /root/src

# Newer version of git
yum remove -y git
wget https://github.com/git/git/archive/v2.4.5.tar.gz
tar xzf v2.4.5.tar.gz
cd git-2.4.5
make prefix=/usr all && make prefix=/usr install
