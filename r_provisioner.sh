#!/bin/bash -x

mkdir /root/src/
cd /root/src/

## Configure default locale, see https://github.com/rocker-org/rocker/issues/19
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen en_US.utf8
/usr/sbin/update-locale LANG=en_US.UTF-8

export LC_ALL="en_US.UTF-8"

## Use Debian repo at CRAN, and use RStudio CDN as mirror
## This gets us updated r-base, r-base-dev, r-recommended and littler
apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480
echo "deb http://cran.rstudio.com/bin/linux/ubuntu/ precise/" > /etc/apt/sources.list.d/r-cran.list
apt-get update

## For R 3.2

export R_BASE_VERSION=3.2.0-4

# ## Now install R and littler, and create a link for littler in /usr/local/bin
apt-get install -y --no-install-recommends r-base=${R_BASE_VERSION}* r-base-dev=${R_BASE_VERSION}* r-recommended=${R_BASE_VERSION}*

git clone https://github.com/eddelbuettel/littler
cd littler
sh bootstrap && make install
cd -

ln -s /root/src/littler/examples/install.r /usr/local/bin/install.r
ln -s /root/src/littler/examples/install2.r /usr/local/bin/install2.r
ln -s /root/src/littler/examples/installGithub.r /usr/local/bin/installGithub.r
ln -s /root/src/littler/examples/testInstalled.r /usr/local/bin/testInstalled.r

## Set a default CRAN Repo
echo 'options(repos = list(CRAN="http://cran.rstudio.com/"))' >> /etc/R/Rprofile.site

install.r docopt

## For the R client
apt-get install -y curl libcurl3-openssl-dev
install.r RJSONIO RCurl digest
echo -e '#!/usr/bin/Rscript\nsource("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))' > /tmp/installsynapse.R
Rscript /tmp/installsynapse.R

rm /tmp/installsynapse.R
