BiocManager::install("AnVIL")
AnVIL::install("GenomicSuperSignature", version = "devel")
devtools::install_github("shbrief/GenomicSuperSignaturePaper")
devtools::install_github("ebecht/MCPcounter", 
                         ref = "a79614eee002c88c64725d69140c7653e7c379b4",
                         subdir = "Source",
                         dependencies = TRUE)

x <- readRDS("pkgs_to_install.rds")
if (x %in% installed.packages()) {
    AnVIL::install(x)
}