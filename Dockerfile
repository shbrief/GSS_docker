#############################################################
# Build a GenomicSuperSignaturePaper container for Terra
#############################################################

# Set the base image
# Google Cloud SDK is already available in this image
FROM us.gcr.io/anvil-gcr-public/anvil-rstudio-bioconductor:3.13.2	

## File system
WORKDIR /home/rstudio
COPY --chown=rstudio:rstudio . /home/rstudio

RUN gsutil cp gs://genomic_super_signature/terra_startup_script.sh /home/rstudio
RUN chmod 775 /home/rstudio/terra_startup_script.sh
RUN ./home/rstudio/terra_startup_script.sh

# `RUN rm -f -v !("GenomicSuperSignature")` is not working?!
RUN rm -f /home/rstudio/Dockerfile
RUN rm -f /home/rstudio/install_R_pkgs.R
RUN rm -f /home/rstudio/README.md
RUN rm -f /home/rstudio/pkgs_to_install.rds
RUN rm -f /home/rstudio/*.sh


USER $USER
# We want pip to install into the user's dir when the notebook is running.
ENV PIP_USER=true

# Note: this entrypoint is provided for running Jupyter independently of Leonardo.
# When Leonardo deploys this image onto a cluster, the entrypoint is overwritten to enable
# additional setup inside the container before execution. Jupyter execution occurs when the
# init-actions.sh script uses 'docker exec' to call run-jupyter.sh.
ENTRYPOINT ["/usr/local/bin/jupyter", "notebook"]