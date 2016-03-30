#!/bin/bash -x

# Provisioner for software

mkdir /root/src/
cd /root/src/

yum remove -y R-core R-core-devel R-java R-java-devel
# yum update -y
yum install -y curl libcurl libcurl-devel readline readline-devel readline-static

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
