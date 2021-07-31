#############################################################
# Build a GenomicSuperSignaturePaper container
#############################################################

# Set the base image
# FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.13.2
FROM us.gcr.io/broad-dsp-gcr-public/terra-jupyter-bioconductor

# File Author / Maintainer
MAINTAINER Sehyun Oh <shbrief@gmail.com>

# Working directory
WORKDIR /home/rstudio
COPY --chown=rstudio:rstudio . /home/rstudio/

# Add the Cloud SDK distribution URI as a package source
# Import the Google Cloud public key
# Update the package list and install the Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install google-cloud-sdk \
	&& rm -rf /var/lib/apt/lists/*

# Install packages
ADD ./install_R_pkgs.R /tmp/
ADD ./pkgs_to_install.rds /tmp/
RUN chmod 755 /tmp/install_R_pkgs.R
RUN Rscript /tmp/install_R_pkgs.R

# # Download data
# RUN chmod 755 ./startup.sh
# RUN ./startup.sh