#!/bin/bash -x

pip install synapseclient

## For the R client
apt-get install -y curl libcurl3-openssl-dev
install.r RJSONIO RCurl digest
echo -e '#!/usr/bin/Rscript\nsource("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))' > /tmp/installsynapse.R
Rscript /tmp/installsynapse.R

rm /tmp/installsynapse.R
