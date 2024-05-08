library(Seurat)
library(ggplot2)
library(patchwork)
library(SeuratData)
library(cowplot)
library(dplyr)
BiocManager::install("optima")
library(optima)

#multimodal data rna + atac
seurat_object <- Read10X_h5("/Users/carolinaatria/Desktop/ADesktop/Studium/PhD/unicellulars/abeoforma/filtered_feature_bc_matrix.h5")




#pando
seurat_object <- initiate_grn(seurat_object)
peaks <- Read10X_h5("/Users/carolinaatria/Desktop/ADesktop/Studium/PhD/unicellulars/abeoforma/")


sponge.atac <- CreateSeuratObject(counts = seurat_object, assay = "ATAC")

seurat_object <- find_motifs(
  seurat_object,
  pfm = motifs,
  genome = "/Users/carolinaatria/Desktop/ADesktop/Studium/PhD/data.nosync/abeoforma_whisleri/genome/abeoforma_genome_barcelona/Abeoforma_genome_v2.fasta"
)