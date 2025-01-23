# Load required libraries
library(readr)
library(dplyr)
library(enrichR)

# Step 1: Read and process input data
# Load clinical data
clinData <- read_csv("input/Blalock_clin_final.csv")
clinData <- as.data.frame(clinData)
clinData <- clinData[, c(ncol(clinData), 1:(ncol(clinData) - 1))]  # Rearrange columns
rownames(clinData) <- clinData[, 1]  # Set row names
clinData <- clinData[, -1]  # Remove redundant column

# Load gene expression data
geneExp <- read.table(
  file = "input/GSE62232_Blalock_geneexp_final.tsv",
  sep = "\t",
  row.names = 1,
  header = TRUE,
  stringsAsFactors = FALSE
)

# Step 2: Identify groups for comparison
# Subset clinical data into baseline (Control) and comparison (Incipient) groups
baselineGrpLabels <- which(clinData$DISEASE_STATUS == "Control")
relapseGrpLabels <- which(clinData$DISEASE_STATUS == "Incipient")
clinBase <- clinData[baselineGrpLabels, ]
clinComp <- clinData[relapseGrpLabels, ]

# Subset gene expression data based on clinical data
geneExpBase <- geneExp[, colnames(geneExp) %in% rownames(clinBase)]
geneExpComp <- geneExp[, colnames(geneExp) %in% rownames(clinComp)]

# Step 3: Quality control checks
# Verify sample IDs match between clinical and gene expression data
if (!setequal(rownames(clinBase), colnames(geneExpBase)) || !setequal(rownames(clinComp), colnames(geneExpComp))) {
  stop("Sample IDs in clinical data do not match gene expression data!")
}

# Save IDs for manual verification
write.table(rownames(clinBase), file = "output/NatalieEllisClinBaseIDs.tsv", sep = "\t", quote = FALSE)
write.table(rownames(clinComp), file = "output/NatalieEllisClinCompIDs.tsv", sep = "\t", quote = FALSE)
write.table(colnames(geneExpBase), file = "output/NatalieEllisGeneExpBaseIDs.tsv", sep = "\t", quote = FALSE)
write.table(colnames(geneExpComp), file = "output/NatalieEllisGeneExpCompIDs.tsv", sep = "\t", quote = FALSE)

# Step 4: Perform T-test
# Load custom T-test function
source("input/fnTTest.R")

ttestResults <- fnTTest(
  baseGroup = geneExpBase,
  compGroup = geneExpComp,
  testName = "Test1",
  baseGroupName = "Control",
  compGroupName = "Incipient",
  folderName = "output"
)

# Read and filter results based on p-value (significance threshold)
ttestResults <- read_csv("output/Test1_Incipent_(Comp).vs._Control_(Base).TTest.csv")
ttestResultsSorted <- ttestResults %>% arrange(Pvalue)
whichSig <- which(ttestResultsSorted$Pvalue <= 0.01)
ttestResultsSig <- ttestResultsSorted[whichSig, ]

# Save shortlisted significant results
write.table(
  x = ttestResultsSig,
  file = "output/AD_Ttest_Shortlisted.tsv",
  quote = FALSE,
  sep = "\t"
)

# Extract gene names
funcSplit <- function(featureX) {
  f1 <- unlist(strsplit(x = featureX, split = "|", fixed = TRUE))
  f2 <- f1[2]
  return(f2)
}

geneNames <- apply(X = as.matrix(ttestResultsSig$Feature), MARGIN = 1, FUN = funcSplit)
write.table(
  x = geneNames,
  file = "output/SigDiffExpressedGenes.tsv",
  quote = FALSE,
  sep = "\t"
)

# Step 5: Enrichment analysis
# Load database list and custom enrichment function
dblist <- read.csv("input/2023-EnrichR-Databases.txt", header = FALSE, stringsAsFactors = FALSE)
source("input/functionEnrichment.R")

# Run enrichment analysis
outputFileName <- "output/EnrichR.xlsx"
source(file = "input/functionEnrichment.R") 
functionEnrichment(dblist, geneNames, outputFileName)

cat("Pipeline complete. Outputs saved in the output/ directory.")
