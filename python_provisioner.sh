#!/bin/bash -x

apt-get update
apt-get install -y --no-install-recommends ed less locales wget
apt-get install -y python python3 python-dev build-essential

apt-get install -y ipython
apt-get install -y cython

## For Snakemake
curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python3.2
easy_install-3.2 pip
pip3 install virtualenv
pip3 install snakemake

curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python2.7
easy_install-2.7 pip
pip install virtualenv
rm setuptools-17.0.zip

## Synapse Python client
pip install synapseclient

## For pandas
pip install numpy
pip install pandas

## For cloudbiolinux
apt-get remove -y python-fabric
apt-get clean all
pip install fabric
git clone git://github.com/chapmanb/cloudbiolinux.git
cd cloudbiolinux
fab -f fabfile.py -H localhost install_biolinux:flavor=ngs_pipeline_minimal

# AWS CLI
pip install awscli

## Cleanup
rm -rf /tmp/downloaded_packages/ /tmp/*.rds
rm -rf /var/lib/apt/lists/*
