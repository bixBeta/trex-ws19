# INSTALL Packages Required for this Exercise
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
if (!requireNamespace("DESeq2", quietly = TRUE))
  BiocManager::install("DESeq2")
if (!requireNamespace("dplyr", quietly = TRUE))
 install.packages("dplyr")

# Install pheatmap and tidyverse using the toolbar 

# Load count matrix
counts = read.table("RawCounts.txt", sep = "\t", header = T, row.names = 1)

# Load phenodata 
target = read.table("target.txt", header = T, sep = "\t", row.names = 1)

# load DESeq2 and other packages into R
library("DESeq2")
library("dplyr")


## -------------------------------------------------------------------------------------------------------------------
# Create DESeq class object and Run DESeq
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = target,
                              design = ~ group)

# treatments = unique(target$group) # Treatments of interest
# dds$condition <- factor(colData(dds)$group,
#                         levels = treatments)

## -------------------------------------------------------------------------------------------------------------------
# Run DESeq
dds <- DESeq(dds)
plotDispEsts(dds)

## -------------------------------------------------------------------------------------------------------------------
# Run PCA
vsd <- vst(dds, blind=FALSE)
pca =  plotPCA(vsd, intgroup = "group")
pca
pca$data



## -------------------------------------------------------------------------------------------------------------------
# Re-RUN everything after removing the  outlier sample

counts.filtered = counts %>% select(-A6hr.2)
target.filtered = target[rownames(target) != "A6hr.2",]

# Create DESeq class object and Run DESeq
dds.filtered <- DESeqDataSetFromMatrix(countData = counts.filtered,
                                       colData = target.filtered,
                                       design = ~ group)

# Run DESeq on filtered data 
dds.filtered <- DESeq(dds.filtered)
plotDispEsts(dds.filtered)

# Run PCA on filtered data 
vsd.filtered <- vst(dds.filtered, blind=FALSE)
pca.filtered =  plotPCA(vsd.filtered, intgroup="group")
pca.filtered
pca.filtered$data

## -------------------------------------------------------------------------------------------------------------------
# Save normalized counts to  file 
dds.filtered@assays$data$counts %>% head()
norm.counts = counts(dds.filtered, normalized=TRUE)
write.csv(norm.counts, "Normalized_Count_Matrix.csv")


## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR A6hr v. A0hr conditions 
A6.A0 <- results(dds.filtered, contrast=c("group", "A6hr", "A0hr"), alpha = 0.05)
A6.A0 %>% head()
plotMA(A6.A0, alpha = 0.05)
write.csv(A6.A0, file = paste0( "A6vA0_results.csv"))


## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR A24hr v. A0hr conditions 
A24.A0 <- results(dds.filtered, contrast=c("group", "A24hr", "A0hr"), alpha = 0.05)
A24.A0 %>% head()
write.csv(A24.A0, file = paste0( "A24vA0_results.csv"))


## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR T6hr v. T0hr conditions 
T6.T0 <- results(dds.filtered, contrast=c("group", "T6hr", "T0hr"), alpha = 0.05)
write.csv(T6.T0, file = paste0( "T6vT0_results.csv"))


## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR T24hr v. T0hr conditions 
T24.T0 <- results(dds.filtered, contrast=c("group", "T24hr", "T0hr"), alpha = 0.05)
write.csv(T24.T0, file = paste0( "T24vT0_results.csv"))


## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR T24hr v. A24hr conditions 
T24.A24 <- results(dds.filtered, contrast=c("group", "T24hr", "A24hr"), alpha = 0.05)
write.csv(T24.A24, file = paste0( "T24vA24_results.csv"))
plotMA(T24.A24, alpha = 0.05)

## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR T6hr v. A6hr conditions 
T6.A6 <- results(dds.filtered, contrast=c("group", "T6hr", "A6hr"), alpha = 0.05)
write.csv(T6.A6, file = paste0( "T6vA6_results.csv"))


## -------------------------------------------------------------------------------------------------------------------
# CALCULATE THE FOLDCHANGES FOR T0hr v. A0hr conditions 
T0.A0 <- results(dds.filtered, contrast=c("group", "T0hr", "A0hr"), alpha = 0.05)
write.csv(T0.A0, file = paste0( "T0vA0_results.csv"))



## HEATMAP 
library("pheatmap")
library("tidyverse")
comp = as.data.frame(A24.A0)

hmap.query = comp %>%
                  rownames_to_column("genes") %>%
                  filter(., padj < 0.05 & baseMean > 1000)

vsd.filtered.table = as.data.frame(assay(vsd.filtered))

hmap.matrix = vsd.filtered.table[rownames(vsd.filtered.table) %in% hmap.query$genes ,]
pheatmap(hmap.matrix, scale = "row")




