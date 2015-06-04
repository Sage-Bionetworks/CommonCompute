#!/bin/bash -x

pushd /root/src/

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

## For cloudbiolinux
## Upgrade this first due to config file conflict
apt-get -o Dpkg::Options::="--force-confnew" install -y cloud-init
apt-get remove -y python-fabric
apt-get clean all
pip install fabric
git clone git://github.com/chapmanb/cloudbiolinux.git

pushd cloudbiolinux
fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal
popd


## For Sailfish
mkdir ~/external-software/
cd ~/external-software
https://github.com/kingsfordgroup/sailfish/releases/download/v0.6.3/Sailfish-0.6.3-Linux_x86-64.tar.gz
tar -xvzf Sailfish-0.6.3-Linux_x86-64.tar.gz
export LD_LIBRARY_PATH=~/external-software/Sailfish-0.6.3-Linux_x86-64/lib:$LD_LIBRARY_PATH
export PATH=~/external-software/Sailfish-0.6.3-Linux_x86-64/bin:$PATH


# AWS CLI
pip install awscli


## Cleanup
rm -rf /tmp/downloaded_packages/ /tmp/*.rds
rm -rf /var/lib/apt/lists/*
