#!/bin/bash

## Set a default CRAN repo
cp /home/centos/Rprofile.site /usr/lib64/R/etc/Rprofile.site

## Install R packages
Rscript -e ' install.packages(c("docopt", "devtools", "dplyr", "tidyr", "ggplot2", "reshape2", "knitr", "stringr", "readr", "plyr", "data.table", "rJava", "doParallel", "snow", "igraph", "Rcpp", "RcppEigen", "Rclusterpp", "RColorBrewer", "MRCE", "vbsr", "ctv", "psych", "reshape2", "vcd", "erer", "fpc"))'

## Install synapse R client
Rscript -e ' install.packages(c("RJSONIO", "RCurl", "digest")); source("http://depot.sagebase.org/CRAN.R"); pkgInstall(c("synapseClient"))'

## Install base bioconductor packages
Rscript -e ' source("http://www.bioconductor.org/biocLite.R") ; biocLite(c("limma", "biovizBase", "e1071", "org.Hs.eg.db", "edgeR", "AnnotationDbi", "biomaRt", "ComplexHeatmap", "FDb.InfiniumMethylation.hg19", "RDAVIDWebService", "topGO", "goseq", "GO.db", "GSVA", "org.Hs.eg.db", "edgeR", "limma", "CePa", "Biobase", "pracma", "annotate", "BiocInstaller", "Biostrings", "GEOquery", "GOstats", "graph", "GSEABase", "impute", "preprocessCore"))'

## Install rGithub client
Rscript -e ' library(devtools); install_github("brian-bot/githubr")'

## Install Rmpi
Rscript -e ' install.packages("Rmpi", configure.args = c("--with-Rmpi-include=/usr/include/openmpi-x86_64","--with-Rmpi-libpath=/usr/lib64/openmpi/lib","--with-Rmpi-type=OPENMPI"))'

## Install additional R packages
Rscript -e ' install.packages(c("WGCNA", "idr"))'
