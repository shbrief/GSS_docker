#############################################################
# Build a GenomicSuperSignaturePaper container for Terra
#############################################################

# Set the base image
## Google Cloud SDK is already available in this image
#FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.13.2	
# Set the base image
FROM bioconductor/bioconductor_docker:devel

# Add the Cloud SDK distribution URI as a package source
# Import the Google Cloud public key
# Update the package list and install the Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
	&& apt-get update \
	&& apt-get -y --no-install-recommends install google-cloud-sdk \
	&& rm -rf /var/lib/apt/lists/*


RUN gsutil cp gs://genomic_super_signature/terra_startup_script.sh .
RUN chmod 775 terra_startup_script.sh
RUN ./terra_startup_script.sh