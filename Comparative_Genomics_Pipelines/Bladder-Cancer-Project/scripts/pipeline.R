# Load required libraries
library(readr)
library(dplyr)
library(enrichR)

# Define file paths
input_clinical_file <- "input/BC_ClinData_233rows.csv"
input_gene_exp_file <- "input/BC_GeneExpData_withAnno_233.tsv"
enrichr_db_file <- "input/2023-EnrichR-Databases.txt"
output_folder <- "output/"

# Step 1: Differential Gene Expression Analysis (T-test)

# Load clinical data
clin_data <- read_csv(input_clinical_file)

# Load gene expression data
gene_exp <- read_tsv(input_gene_exp_file)
gene_exp <- as.data.frame(gene_exp)
rownames(gene_exp) <- gene_exp[, 1]
gene_exp <- gene_exp[, -1]

# Filter clinical data for the two groups (Normal and Precancerous)
normal_samples <- clin_data %>% filter(PrimaryBladderCancerType == "Normal bladder mucosae")
precancer_samples <- clin_data %>% filter(PrimaryBladderCancerType == "Bladder mucosae surrounding cancer")

# Extract relevant columns from gene expression data
gene_exp_normal <- gene_exp[, colnames(gene_exp) %in% normal_samples$Sample.name]
gene_exp_precancer <- gene_exp[, colnames(gene_exp) %in% precancer_samples$Sample.name]

# Source the T-test function
source("/Users/natalieellis/Documents/HIDS_7003/FinalProject/fnTTest.R")

# Call the T-test function
results1 <- fnTTest(
  baseGroup = gene_exp_normal,
  compGroup = gene_exp_precancer,
  testName = "Test1",
  baseGroupName = "Normal",
  compGroupName = "Precancerous",
  folderName = output_folder
)

# Step 2: Pathway Enrichment Analysis with EnrichR

# Read the T-test results file
ttest_results <- read_csv(paste0(output_folder, "Test1_Precancerous_(Comp).vs._Normal_(Base).TTest.csv"))

# Filter significant genes based on FDR <= 0.01
ttest_results_sig <- ttest_results %>% filter(FDR <= 0.01)

# Extract gene names and remove duplicates
extract_gene_names <- function(feature) {
  unlist(strsplit(feature, "|", fixed = TRUE))[2]
}
gene_list <- unique(na.omit(sapply(ttest_results_sig$Feature, extract_gene_names)))

# Save the shortlisted gene list
write.csv(gene_list, paste0(output_folder, "shortlisted_genes.csv"), row.names = FALSE)

# Load EnrichR database list
enrichr_dbs <- read.csv(enrichr_db_file, header = FALSE, stringsAsFactors = FALSE)$V1

# Run EnrichR analysis
enrichr_results <- enrichR::enrichr(genes = gene_list, databases = enrichr_dbs)

# Save EnrichR results to an Excel file
output_enrichr_file <- paste0(output_folder, "EnrichR_Results.xlsx")
openxlsx::write.xlsx(enrichr_results, output_enrichr_file)

cat("Pipeline complete. Results saved in the output folder.")
