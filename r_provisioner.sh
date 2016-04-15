#!/bin/bash -x

mkdir /home/centos/src/
cd /home/centos/src/

export PATH=$PATH:/usr/local/bin
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH

## Install R from source
yum -y install libpng-devel libjpeg-devel libtiff-devel ghostscript-devel curl curl-devel libcurl libcurl-devel
#yum install --enablerepo=epel -y R-core R-core-devel R-devel
wget https://cran.r-project.org/src/base/R-3/R-3.2.3.tar.gz
tar xzf R-3.2.3.tar.gz
cd R-3.2.3
./configure --with-x=yes --enable-R-shlib --enable-BLAS-shlib --enable-R-profiling --enable-memory-profiling JAVA_HOME=/usr/lib/jvm/java-openjdk --with-cairo=yes
make && make install && make clean

# Link openblas library for R blas
mv /usr/local/lib64/R/lib/libRblas.so /usr/local/lib64/R/lib/libRblas.so.keep
ln -s /opt/OpenBLAS/lib/libopenblas.so /usr/local/lib64/R/lib/libRblas.so

## Install littler
cd /home/centos/src
wget http://dirk.eddelbuettel.com/code/littler/littler-0.2.3.tar.gz
tar xzf littler-0.2.3.tar.gz
cd littler-0.2.3
./bootstrap && ./configure && make && make install && make clean

mkdir -p /opt/littler-0.2.3/bin/
cp /home/centos/src/littler-0.2.3/examples/*.r /opt/littler-0.2.3/bin/

## Use RStudio CDN as mirror
## Set a default CRAN repo
cp /home/centos/Rprofile.site /usr/local/lib64/R/etc/Rprofile.site

## Use the default CRAN repo with littler
cp /home/centos/little.r /etc/littler.r
