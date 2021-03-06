BiocManager::install("AnVIL")
devtools::install_github("shbrief/GenomicSuperSignature")
devtools::install_github("shbrief/GenomicSuperSignaturePaper")
devtools::install_github("ebecht/MCPcounter", 
                         ref = "a79614eee002c88c64725d69140c7653e7c379b4",
                         subdir = "Source",
                         dependencies = TRUE)

pkgs <- readRDS("/home/rstudio/pkgs_to_install.rds")
for (x in pkgs) {if (!x %in% installed.packages()) {AnVIL::install(x)}}

webshot::install_phantomjs()