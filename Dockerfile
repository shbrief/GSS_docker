#############################################################
# Build a GenomicSuperSignaturePaper container
#############################################################

# Set the base image
FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.13.2

# File Author / Maintainer
MAINTAINER Sehyun Oh <shbrief@gmail.com>

# Working directory
WORKDIR /home/rstudio
COPY --chown=rstudio:rstudio . /home/rstudio/

# Install gsutil
RUN curl -sSL https://sdk.cloud.google.com | bash
ENV PATH $PATH:/root/google-cloud-sdk/bin

# Install packages
ADD ./install_R_pkgs.R /tmp/
ADD ./pkgs_to_install.rds /tmp/
RUN chmod 755 /tmp/install_R_pkgs.R
RUN Rscript /tmp/install_R_pkgs.R

RUN chmod 755 ./startup.sh
RUN ./startup.sh