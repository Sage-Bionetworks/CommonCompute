#!/bin/bash -x

mkdir /home/centos/src/
cd /home/centos/src/

## Install R from source with dependencies
# Install R dependencies
yum -y install libpng-devel libjpeg-devel libtiff-devel ghostscript-devel curl curl-devel libcurl libcurl-devel

# Install latest version of openmpi
yum -y install openmpi-1.10
module add openmpi-1.10-x86_64

# Install zlib from source
cd /home/centos/src
wget http://zlib.net/zlib-1.2.11.tar.gz
tar xzvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=/usr/local/
make && make install && make clean

export PATH=/usr/local/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/lib:/opt/OpenBLAS/lib:/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH
export CFLAGS="-I/usr/local/include"
export LDFLAGS="-L/usr/local/lib"

# Install bzip from source
cd /home/centos/src
wget http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz
tar xzvf bzip2-1.0.6.tar.gz
cd bzip2-1.0.6
make -f Makefile-libbz2_so
make install PREFIX=/usr/local
make clean

# Install xz from source
cd /home/centos/src
wget http://tukaani.org/xz/xz-5.2.2.tar.gz
tar xzvf xz-5.2.2.tar.gz
cd xz-5.2.2
./configure --prefix=/usr/local
make -j3 && make install && make clean

# Install pcre from source
cd /home/centos/src
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz
tar xzvf pcre-8.38.tar.gz
cd pcre-8.38
./configure --prefix=/usr/local --enable-utf8
make -j3 && make install && make clean

# Install curl from source
cd /home/centos/src
wget --no-check-certificate https://curl.haxx.se/download/curl-7.47.1.tar.gz
tar xzvf curl-7.47.1.tar.gz
cd curl-7.47.1
./configure --prefix=/usr/local
make -j3 && make install && make clean

## Get R from source
cd /home/centos/src
wget https://cran.r-project.org/src/base/R-3/R-3.3.1.tar.gz
tar xzf R-3.3.1.tar.gz
cd R-3.3.1
./configure --with-cairo --with-x --with-jpeglib --with-readline --with-tclk --with-blas  --enable-R-shlib --enable-BLAS-shlib --enable-R-profiling --enable-memory-profiling JAVA_HOME=/usr/lib/jvm/java-openjdk
make && make install && make clean

# Link openblas library for R blas
mv /usr/local/lib64/R/lib/libRblas.so /usr/local/lib64/R/lib/libRblas.so.keep
ln -s /opt/OpenBLAS/lib/libopenblas.so /usr/local/lib64/R/lib/libRblas.so

## Use RStudio CDN as mirror
## Set a default CRAN repo
cp /home/centos/Rprofile.site /usr/local/lib64/R/etc/Rprofile.site
