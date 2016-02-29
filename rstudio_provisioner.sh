#!/bin/bash -x

## Install Rstudio server
wget https://download2.rstudio.org/rstudio-server-rhel-0.99.891-x86_64.rpm
sudo yum -y install --nogpgcheck rstudio-server-rhel-0.99.891-x86_64.rpm

## Copy Rstudio configuration file
cp /home/centos/rserver.conf /etc/rstudio/rserver.conf

## Restart Rstudio server
rstudio-server restart

