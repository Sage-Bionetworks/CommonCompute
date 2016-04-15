#!/bin/bash -x

cd /home/centos/src

## Install Rstudio server
wget https://download2.rstudio.org/rstudio-server-rhel-0.99.893-x86_64.rpm
rpm -Uvh rstudio-server-rhel-0.99.893-x86_64.rpm

## Copy Rstudio configuration file
cp /home/centos/rserver.conf /etc/rstudio/rserver.conf

## Restart Rstudio server
rstudio-server verify-installation

## Install additional R packages
#Rscript -e 'install.packages(c("MRCE", "vbsr", "ctv", "psych", "reshape2", "vcd", "erer", "fpc"))'
 
#Rscript -e 'source("http://bioconductor.org/biocLite.R") ; biocLite(pkgs=c("RDAVIDWebService", "topGO", "goseq", "GO.db", "GSVA", "org.Hs.eg.db", "edgeR", "limma", "CePa", "Biobase", "pracma", "annotate", "AnnotationDbi", "BiocInstaller", "biomaRt", "Biostrings", "edgeR", "GEOquery", "GOstats", "graph", "GSEABase", "impute", "preprocessCore", "GO.db", "ComplexHeatmap", "FDb.InfiniumMethylation.hg19"))'

#Rscript -e 'install.packages(c("WGCNA", "idr"))'

## Copy synapse config file
#cp /home/centos/synapseConfig /home/centos/.synapseConfig
