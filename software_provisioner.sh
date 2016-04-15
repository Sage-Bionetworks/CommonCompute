#!/bin/bash -x

# Provisioner for software

mkdir /home/centos/src/
cd /home/centos/src/

yum remove -y R-core R-core-devel R-java R-java-devel
yum update -y
yum install -y curl curl-devel libcurl libcurl-devel readline readline-devel readline-static

## OpenBlas from source
mkdir /home/centos/src/OpenBlas
cd /home/centos/src/OpenBlas

# We need to update binutils in CentOS6 for latest kernels (see https://github.com/xianyi/OpenBLAS/wiki/faq#binutils)
wget http://sourceforge.net/projects/slurm-roll/files/addons/6.1.1/rpms/pb-binutils224-2.24-1.x86_64.rpm
rpm -Uvh pb-binutils224-2.24-1.x86_64.rpm
export PATH=/opt/pb/binutils-2.24/bin:$PATH

wget http://github.com/xianyi/OpenBLAS/archive/v0.2.15.tar.gz
tar xzf v0.2.15.tar.gz
cd OpenBLAS-0.2.15/
make BINARY=64 FC=gfortran USE_THREAD=1 && make install && make clean

# Copy openblas to lapak and blas library
cp /opt/OpenBLAS/lib/libopenblas.so /opt/OpenBLAS/lib/liblapack.so.3
cp /opt/OpenBLAS/lib/libopenblas.so /opt/OpenBLAS/lib/libblas.so.3

cd /home/centos/src

## Newer version of git from source
yum remove -y git
yum groupinstall -y "Development Tools"
yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel expat-devel
yum install -y gcc perl-ExtUtils-MakeMaker
wget https://github.com/git/git/archive/v2.7.1.tar.gz
tar -xzf v2.7.1.tar.gz
cd git-2.7.1
make configure
./configure --prefix=/usr/local --with-curl
make all && make install && make clean
