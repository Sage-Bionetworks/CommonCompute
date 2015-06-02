#!/bin/bash -x

apt-get update
apt-get install -y --no-install-recommends ed less locales wget
apt-get install -y python python3 python-dev build-essential

apt-get install ipython
apt-get install cython

## For Snakemake
curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python3.2
easy_install-3.2 pip
pip3 install virtualenv
pip3 install snakemake

## Synapse Python client
curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python2.7
easy_install-2.7 pip
pip install virtualenv

## For pandas
pip install numpy
pip install pandas

## tophat
wget http://ccb.jhu.edu/software/tophat/downloads/tophat-2.0.13.Linux_x86_64.tar.gz
tar xzf tophat-2.0.13.Linux_x86_64.tar.gz -C /opt/

## samtools
wget "http://downloads.sourceforge.net/project/samtools/samtools/1.1/samtools-1.1.tar.bz2?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsamtools%2Ffiles%2Fsamtools%2F1.1%2F&ts=1422924881&use_mirror=iweb" -O samtools-1.1.tar.bz2
tar xjf samtools-1.1.tar.bz2
make
make install prefix=/opt/samtools-1.1/
cd ..

## Cleanup
rm -rf /tmp/downloaded_packages/ /tmp/*.rds
rm -rf /var/lib/apt/lists/*
