#!/bin/bash
mkdir /shared/rlibs

## Install R packages
Rscript -e 'install.packages(c("docopt", "devtools", "dplyr", "tidyr", "ggplot2", "reshape2", "knitr", "stringr", "readr", "plyr", "data.table", "rJava", "doParallel", "snow", "igraph", "Rcpp", "RcppEigen", "Rclusterpp", "RColorBrewer", "MRCE", "vbsr", "ctv", "psych", "reshape2", "vcd", "erer", "fpc", "pacman"))'

## Install synapse R client
Rscript -e 'install.packages(c("RJSONIO", "RCurl", "digest")); source("http://depot.sagebase.org/CRAN.R"); pkgInstall(c("synapseClient"))'

## Install base bioconductor packages
Rscript -e 'source("http://www.bioconductor.org/biocLite.R") ; biocLite(c("limma", "biovizBase", "e1071", "org.Hs.eg.db", "edgeR", "AnnotationDbi", "biomaRt", "ComplexHeatmap", "FDb.InfiniumMethylation.hg19", "RDAVIDWebService", "topGO", "goseq", "GO.db", "GSVA", "org.Hs.eg.db", "edgeR", "limma", "CePa", "Biobase", "pracma", "annotate", "BiocInstaller", "Biostrings", "GEOquery", "GOstats", "graph", "GSEABase", "impute", "preprocessCore"))'

## Install rGithub client
Rscript -e 'library(devtools); install_github("brian-bot/githubr")'

## Install covariate analysis package from th1vairam
Rscript -e 'library(devtools); install_github("th1vairam/CovariateAnalysis@dev")'

## Install metanetwork from blogsdon
Rscript -e 'library(devtools); install_github("blogsdon/metanetwork")'

## Install Rmpi
export LD_LIBRARY_PATH=/usr/lib64/openmpi-1.10/lib:$LD_LIBRARY_PATH
Rscript -e 'install.packages("Rmpi", configure.args = paste("--with-Rmpi-include=/usr/include/openmpi-1.10-x86_64", "--with-Rmpi-libpath=/usr/lib64/openmpi-1.10/lib", "--with-Rmpi-type=OPENMPI"))'

## Install additional R packages
Rscript -e 'install.packages(c("WGCNA", "idr"))'
