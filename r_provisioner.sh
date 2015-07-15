#!/bin/bash -x

mkdir /root/src/
cd /root/src/

yum install --enablerepo=epel -y R-core R-core-devel R-devel

wget http://dirk.eddelbuettel.com/code/littler/littler-0.2.3.tar.gz
tar xzf littler-0.2.3.tar.gz
cd littler-0.2.3
./bootstrap && ./configure && make && make install

mkdir -p /opt/littler-0.2.3/bin/
cp /root/src/littler-0.2.3/examples/*.r /opt/littler-0.2.3/bin/

ln -s /opt/littler-0.2.3/bin/install.r /usr/local/bin/install.r
ln -s /opt/littler-0.2.3/bin/install2.r /usr/local/bin/install2.r
ln -s /opt/littler-0.2.3/bin/installGithub.r /usr/local/bin/installGithub.r
ln -s /opt/littler-0.2.3/bin/testInstalled.r /usr/local/bin/testInstalled.r

## Use RStudio CDN as mirror
## Set a default CRAN repo
echo 'options(repos = list(CRAN="http://cran.rstudio.com/"))' >> /usr/lib64/R/etc/Rprofile.site

## Use the default CRAN repo with littler
echo 'source("/usr/lib64/R/etc/Rprofile.site")' >> /etc/littler.r

# Rscript -e 'install.packages("docopt")'

## For the R client
yum install -y curl libcurl libcurl-devel
Rscript -e 'install.packages(c("RJSONIO", "RCurl", "digest"))'

Rscript -e 'source("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))'
