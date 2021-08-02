## Startup Script to add when you start Terra Cloud Environment from RStudio

R -e 'BiocManager::install("AnVIL");
devtools::install_github("shbrief/GenomicSuperSignature");
devtools::install_github("shbrief/GenomicSuperSignaturePaper");
devtools::install_github("ebecht/MCPcounter", 
                         ref = "a79614eee002c88c64725d69140c7653e7c379b4",
                         subdir = "Source",
                         dependencies = TRUE);
                         
AnVIL::gsutil_cp("gs://genomic_super_signature/pkgs_to_install.rds", ".");
pkgs <- readRDS("pkgs_to_install.rds");
for (x in pkgs) {if (!x %in% installed.packages()) {AnVIL::install(x)}};
webshot::install_phantomjs()'

## Clone GenomicSuperSignaturePaper repository
git clone https://github.com/shbrief/GenomicSuperSignaturePaper.git

## Download RAVmodels
wget https://storage.googleapis.com/genomic_super_signature/RAVmodel_C2.rds
wget https://storage.googleapis.com/genomic_super_signature/RAVmodel_PLIERpriors.rds
mv RAVmodel_C2.rds GenomicSuperSignaturePaper/inst/extdata/
mv RAVmodel_PLIERpriors.rds GenomicSuperSignaturePaper/inst/extdata/
    
## Build GenomicSuperSignaturePaper package
R CMD INSTALL --no-multiarch --with-keep.source GenomicSuperSignaturePaper
cd GenomicSuperSignaturePaper

## Download data for SLE-WB
mkdir -p Results/SLE-WB/data
wget https://github.com/greenelab/multi-plier/raw/master/data/expression_data/SLE_WB_all_microarray_QN_zto_before_with_GeneSymbol.pcl
mv SLE_WB_all_microarray_QN_zto_before_with_GeneSymbol.pcl Results/SLE-WB/data/
    
wget https://raw.githubusercontent.com/greenelab/rheum-plier-data/master/sle-wb/arrayexpress/E-GEOD-65391/E-GEOD-65391.sdrf.txt
mv E-GEOD-65391.sdrf.txt Results/SLE-WB/data/
    
## Download data for E-MTAB-2452
wget https://github.com/greenelab/multi-plier/raw/master/data/expression_data/E-MTAB-2452_hugene11st_SCANfast_with_GeneSymbol.pcl
mkdir -p Results/E-MTAB-2452/data
mv E-MTAB-2452_hugene11st_SCANfast_with_GeneSymbol.pcl Results/E-MTAB-2452/data/
    
## Download data for TCGA
mkdir -p Results/TCGA/data
gsutil cp gs://genomic_super_signature/TCGA_validationDatasets.rda Results/TCGA/data/
    
## Download data for CRC
mkdir -p Results/CRC/data
gsutil cp gs://genomic_super_signature/eSets_new.zip Results/CRC/data/
unzip Results/CRC/data/eSets_new.zip -d Results/CRC/data/
rm Results/CRC/data/eSets_new.zip
