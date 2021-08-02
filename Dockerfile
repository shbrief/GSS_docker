#############################################################
# Build a GenomicSuperSignaturePaper container for Terra
#############################################################

# Set the base image
# Google Cloud SDK is already available in this image
FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.13.2	

RUN gsutil cp gs://genomic_super_signature/terra_startup_script.sh .
RUN ./terra_startup_script.sh