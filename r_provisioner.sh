#!/bin/bash -x

mkdir /root/src/
cd /root/src/

## Use RStudio CDN as mirror
## Set a default CRAN repo
echo 'options(repos = list(CRAN="http://cran.rstudio.com/"))' >> /usr/lib64/R/etc/Rprofile.site

Rscript -e 'install.packages(c("devtools", "dplyr", "tidyr", "ggplot2", "reshape2", "knitr", "stringr", "readr", "plyr", "data.table"))'
Rscript -e 'install.packages(c("MatrixEQTL"))'

## For the R client
Rscript -e 'install.packages(c("RJSONIO", "RCurl", "digest"))'
Rscript -e 'source("http://depot.sagebase.org/CRAN.R") ; pkgInstall(c("synapseClient"))'

Rscript -e 'source("http://www.bioconductor.org/biocLite.R") ; biocLite(c("limma", "biovizBase", "e1071"))'
