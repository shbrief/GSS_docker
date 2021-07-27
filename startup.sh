## Clone GenomicSuperSignaturePaper repository
git clone https://github.com/shbrief/GenomicSuperSignaturePaper.git
cd GenomicSuperSignaturePaper

## Download RAVmodels
wget https://storage.googleapis.com/genomic_super_signature/RAVmodel_C2.rds
wget https://storage.googleapis.com/genomic_super_signature/RAVmodel_PLIERpriors.rds
mv RAVmodel_C2.rds inst/extdata/
mv RAVmodel_PLIERpriors.rds inst/extdata/
R CMD INSTALL --no-multiarch --with-keep.source GenomicSuperSignaturePaper

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
mkdir -p Results/TCGA/data/
gsutil cp gs://genomic_super_signature/TCGA_validationDatasets.rda Results/TCGA/data/

## Download data for CRC
mkdir -p Results/CRC/data
gsutil cp gs://genomic_super_signature/eSets_new.zip Results/CRC/data
unzip eSets_new.zip
rm eSets_new.zip


