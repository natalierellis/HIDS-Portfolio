# Load necessary libraries
library(readr)
library(dplyr)
library(enrichR)

# Step 1: Read Input Data
clinData <- read_csv("/Users/natalieellis/Documents/HIDS_7003/MidtermProject/input/Blalock_clin_final.csv")
geneExp <- read.table(
  file = "/Users/natalieellis/Documents/HIDS_7003/MidtermProject/input/GSE62232_Blalock_geneexp_final.tsv",
  sep = "\t",
  row.names = 1,
  header = TRUE,
  stringsAsFactors = FALSE
)

# Process clinical data
clinData <- as.data.frame(clinData)
clinData <- clinData[, c(ncol(clinData), 1:(ncol(clinData) - 1))]
rownames(clinData) <- clinData[, 1]  # Set rownames from first column
clinData <- clinData[, -1]           # Remove the first column

# Step 2: Filter and Match Data
baselineGrpLabels <- which(clinData$DISEASE_STATUS == "Control")
relapseGrpLabels <- which(clinData$DISEASE_STATUS == "Incipient")

clinBase <- clinData[baselineGrpLabels, ]
clinComp <- clinData[relapseGrpLabels, ]

geneExpBase <- geneExp[, colnames(geneExp) %in% rownames(clinBase)]
geneExpComp <- geneExp[, colnames(geneExp) %in% rownames(clinComp)]

# Step 3: Sanity Check
are_equal_B <- setequal(rownames(clinBase), colnames(geneExpBase))
are_equal_C <- setequal(rownames(clinComp), colnames(geneExpComp))

if (!are_equal_B || !are_equal_C) {
  stop("Sample IDs in clinical data do not match gene expression data!")
}

# Step 4: Perform T-Test
source("fnTTest.R")

ttestResults <- fnTTest(
  baseGroup = geneExpBase,
  compGroup = geneExpComp,
  testName = "Test1",
  baseGroupName = "Control",
  compGroupName = "Incipient",
  folderName = "output"
)

# Read T-Test Results
ttestResults <- read_csv("output/Test1_Incipent_(Comp).vs._Control_(Base).TTest.csv")

ttestResultsSorted <- ttestResults %>% arrange(Pvalue)
whichSig <- which(ttestResultsSorted$Pvalue <= 0.01)
ttestResultsSig <- ttestResultsSorted[whichSig, ]

write.table(
  x = ttestResultsSig,
  file = "output/AD_Ttest_Shortlisted.tsv",
  quote = FALSE,
  sep = "\t"
)

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

# Step 5: Enrichment Analysis
dblist <- read.csv(
  file = "/Users/natalieellis/Documents/HIDS_7003/MidtermProject/2023-EnrichR-Databases.txt",
  header = FALSE,
  stringsAsFactors = FALSE
)

source(file = "/Users/natalieellis/Documents/HIDS_7003/MidtermProject/input/functionEnrichment.R")

geneList <- na.omit(unique(geneNames))
outputFileName <- paste("/Users/natalieellis/Documents/HIDS_7003/MidtermProject/output/", "EnrichR.xlsx", sep = "")

functionEnrichment(dblist, geneList, outputFileName)

cat("Pipeline complete. Outputs saved in the output/ directory.")
