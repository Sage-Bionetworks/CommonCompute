#!/bin/bash -x

mkdir /root/src/
cd /root/src/

## Use Debian repo at CRAN, and use RStudio CDN as mirror
## This gets us updated r-base, r-base-dev, r-recommended and littler
# apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
# echo "deb http://cran.rstudio.com/bin/linux/ubuntu/ trusty/" > /etc/apt/sources.list.d/r-cran.list
# apt-get update

yum install libXt-devel
wget http://cran.r-project.org/src/base/R-3/R-3.2.1.tar.gz

ln -s /usr/share/doc/littler/examples/install.r /usr/local/bin/install.r
ln -s /usr/share/doc/littler/examples/install2.r /usr/local/bin/install2.r
ln -s /usr/share/doc/littler/examples/installGithub.r /usr/local/bin/installGithub.r
ln -s /usr/share/doc/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r

## Set a default CRAN repo
echo 'options(repos = list(CRAN="http://cran.rstudio.com/"))' >> /etc/R/Rprofile.site

## Use the default CRAN repo with littler
echo 'source("/etc/R/Rprofile.site")' >> /etc/littler.r

install.r docopt

## For the R client
apt-get install -y curl libcurl4-openssl-dev
install.r RJSONIO RCurl digest

r -e 'source("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"), stack="staging")'
