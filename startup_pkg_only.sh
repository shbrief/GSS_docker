#!/usr/bin/env bash

## Clone GenomicSuperSignaturePaper repository
git clone https://github.com/shbrief/GenomicSuperSignaturePaper.git

## Download RAVmodels
wget https://storage.googleapis.com/genomic_super_signature/RAVmodel_C2.rds
wget https://storage.googleapis.com/genomic_super_signature/RAVmodel_PLIERpriors.rds
mv RAVmodel_C2.rds GenomicSuperSignaturePaper/inst/extdata/
mv RAVmodel_PLIERpriors.rds GenomicSuperSignaturePaper/inst/extdata/

### Install packages
#Rscript /home/rstudio/install_R_pkgs.R

### Build GenomicSuperSignaturePaper package
#R CMD INSTALL --no-multiarch --with-keep.source GenomicSuperSignaturePaper
#cd GenomicSuperSignaturePaper