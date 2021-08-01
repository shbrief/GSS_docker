#############################################################
# Build a GenomicSuperSignaturePaper container
#############################################################

# Set the base image
# Google Cloud SDK is already available in this image
FROM us.gcr.io/broad-dsp-gcr-public/terra-jupyter-bioconductor:2.0.0

# File Author / Maintainer
MAINTAINER Sehyun Oh <shbrief@gmail.com>

# Install packages
RUN mkdir /tmp/
ADD ./install_R_pkgs.R /tmp/
ADD ./pkgs_to_install.rds /tmp/
RUN chmod 755 /tmp/install_R_pkgs.R
RUN Rscript /tmp/install_R_pkgs.R

# # Download data
# RUN chmod 755 ./startup.sh
# RUN ./startup.sh