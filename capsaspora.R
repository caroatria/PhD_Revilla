pbmc.data <- Read10X(data.dir = "/Users/work/Library/Mobile Documents/com~apple~CloudDocs/Desktop/ADesktop/Studium/PhD/unicellulars/capsaspora_gex/raw_feature_bc_matrix")
pbmc <- CreateSeuratObject(counts = pbmc.data, project = "pbmc3k", min.cells = 3, min.features = 200)
pbmc
VlnPlot(pbmc, features = c("nFeature_RNA", "nCount_RNA"), ncol = 2)
pbmc <- NormalizeData(pbmc, normalization.method = "LogNormalize", scale.factor = 10000)
pbmc <- NormalizeData(pbmc)

pbmc <- FindVariableFeatures(pbmc, selection.method = "vst", nfeatures = 2000)
top10 <- head(VariableFeatures(pbmc), 10)

# plot variable features with and without labels
plot1 <- VariableFeaturePlot(pbmc)
plot2 <- LabelPoints(plot = plot1, points = top10, repel = TRUE)
plot1 + plot2
all.genes <- rownames(pbmc)
pbmc <- ScaleData(pbmc, features = all.genes)

pbmc <- RunPCA(pbmc, features = VariableFeatures(object = pbmc))
print(pbmc[["pca"]], dims = 1:5, nfeatures = 5)
DimPlot(pbmc, reduction = "pca") + NoLegend()
DimHeatmap(pbmc, dims = 1:15, cells = 500, balanced = TRUE)
