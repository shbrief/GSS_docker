#############################################################
# Build a GenomicSuperSignaturePaper container for Terra
#############################################################

FROM bioconductor/bioconductor_docker:devel

# File system
WORKDIR /home/rstudio
COPY --chown=rstudio:rstudio . /home/rstudio
RUN chown -R rstudio:rstudio /home

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

# `RUN rm -f -v !("GenomicSuperSignature")` is not working?!
RUN rm -f Dockerfile
RUN rm -f install_R_pkgs.R
RUN rm -f README.md
RUN rm -f pkgs_to_install.rds
RUN rm -f *.sh


USER $USER
# We want pip to install into the user's dir when the notebook is running.
ENV PIP_USER=true

# Note: this entrypoint is provided for running Jupyter independently of Leonardo.
# When Leonardo deploys this image onto a cluster, the entrypoint is overwritten to enable
# additional setup inside the container before execution. Jupyter execution occurs when the
# init-actions.sh script uses 'docker exec' to call run-jupyter.sh.
ENTRYPOINT ["/usr/local/bin/jupyter", "notebook"]