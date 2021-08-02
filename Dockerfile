#############################################################
# Build a GenomicSuperSignaturePaper container for Terra
#############################################################

# Set the base image
# Google Cloud SDK is already available in this image
FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.13.2	

# File Author / Maintainer
MAINTAINER Sehyun Oh <shbrief@gmail.com>

# # Install packages
# ADD ./install_R_pkgs.R /tmp/
# ADD ./pkgs_to_install.rds /tmp/
# RUN Rscript /tmp/install_R_pkgs.R

# # Download data
# RUN chmod 755 ./startup.sh
# RUN ./startup.sh