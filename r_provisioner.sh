#!/bin/bash -x

mkdir /root/src/
cd /root/src/

export PATH=$PATH:/usr/local/bin
export LD_LIBRARY_PATH=/opt/OpenBLAS/lib:$LD_LIBRARY_PATH

wget https://cran.rstudio.com/src/base/R-3/R-3.2.3.tar.gz
tar xvzf R-3.2*.tar.gz
cd R-3.2*
./configure --enable-R-shlib && make && make install
cd /root/src/

# Requires R to be built as shared lib (./configure --enable-R-shlib), but get an error when compiling
# wget http://dirk.eddelbuettel.com/code/littler/littler-0.2.3.tar.gz
# tar xzf littler-0.2.3.tar.gz
# cd littler-0.2.3
# ./bootstrap && ./configure && make && make install
# cd /root/src/

# mkdir -p /opt/littler-0.2.3/bin/
# cp /root/src/littler-0.2.3/examples/*.r /opt/littler-0.2.3/bin/

# ln -s /opt/littler-0.2.3/bin/install.r /usr/local/bin/install.r
# ln -s /opt/littler-0.2.3/bin/install2.r /usr/local/bin/install2.r
# ln -s /opt/littler-0.2.3/bin/installGithub.r /usr/local/bin/installGithub.r
# ln -s /opt/littler-0.2.3/bin/testInstalled.r /usr/local/bin/testInstalled.r

## Use RStudio CDN as mirror
## Set a default CRAN repo
echo 'options(repos = list(CRAN="http://cran.rstudio.com/"))' >> /usr/local/lib64/R/etc/Rprofile.site

# ## Use the default CRAN repo with littler
# echo 'source("/usr/local/lib64/R/etc/Rprofile.site")' >> /etc/littler.r

# Rscript -e 'install.packages("docopt")'

Rscript -e 'install.packages(c("devtools", "dplyr", "tidyr", "ggplot2", "reshape2", "knitr", "stringr", "readr", "plyr", "data.table"))'

## For the R client
Rscript -e 'install.packages(c("RJSONIO", "RCurl", "digest"))'

Rscript -e 'source("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))'
Rscript -e 'source("http://www.bioconductor.org/biocLite.R") ; biocLite(c("limma", "biovizBase", "e1071"))'
