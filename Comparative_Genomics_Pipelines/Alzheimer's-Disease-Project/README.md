# Alzheimer's Disease Biomarker Discovery

This project focuses on utilizing gene expression data to identify potential molecular biomarkers and drug targets for Alzheimer’s Disease (AD). The study compares gene expression profiles of incipient AD subjects with normal controls. The project was completed as part of the **HIDS-7003 Midterm Project**.

---

## Project Overview

As a student bioinformatician on an interdisciplinary team, I conducted differential gene expression analysis and systems biology enrichment to uncover pathways and genes relevant to AD.

### **Goals:**
1. Identify differentially expressed genes (DEGs) between incipient AD subjects and controls.
2. Perform enrichment analysis on DEGs to identify biological pathways, gene ontologies, and molecular functions associated with AD.

---

## Project Files and Structure

### **Directories:**
- `input/`: Contains raw input files for the analysis.
  - `Blalock_clin_final.csv`: Clinical data for 30 patients.
  - `GSE62232_Blalock_geneexp_final.tsv`: Processed gene expression data.
  - `2023-EnrichR-Databases.txt`: List of databases used in enrichment analysis.
  - `fnTTest.R`: Function to perform T-tests for group comparisons.
  - `functionEnrichment.R`: Function for running enrichment analysis using EnrichR.

- `output/`: Contains generated results.
  - `Test1_Incipent_(Comp).vs._Control_(Base).TTest.csv`: Results of the T-test analysis.
  - `AD_Ttest_Shortlisted.tsv`: Shortlisted DEGs (p-value ≤ 0.01).
  - `SigDiffExpressedGenes.tsv`: Significant gene names (duplicates removed).
  - `EnrichR.xlsx`: Multi-tab Excel file with enrichment results.
 
- `Team1_AD_Midterm_Presentation.pptx`: PowerPoint slides summarizing the analysis and findings.

- `combined_pipeline.R`: R script combining all analysis steps.

---

## Analysis Workflow

### **Step 1: Group Comparison Analysis**
- **Objective**: Identify DEGs between incipient AD subjects and controls.
- **Methods**:
  1. Import clinical and gene expression data.
  2. Subset data into two groups: `Control` and `Incipient`.
  3. Perform T-tests for each gene to identify DEGs (p-value ≤ 0.01).

- **Output**:
  - `Test1_Incipent_(Comp).vs._Control_(Base).TTest.csv`
  - `AD_Ttest_Shortlisted.tsv`
  - `SigDiffExpressedGenes.tsv`

### **Step 2: Systems Biology Enrichment**
- **Objective**: Interpret DEGs using pathway and ontology analysis.
- **Methods**:
  1. Use EnrichR to query biological databases.
  2. Analyze enriched pathways and categories relevant to AD.
- **Output**:
  - `EnrichR.xlsx`: Multi-tab Excel file with enrichment results.

### **Step 3: Biomedical Interpretation**
- **Objective**: Develop biological insights from enriched pathways and select top candidate biomarkers.
- **Results**:
  - Key pathways and gene ontologies linked to AD progression.
  - Shortlist of candidate genes as potential biomarkers.

### **Step 4: Presentation**
- **Objective**: Summarize findings in a team presentation.
- **File**: `Team1_AD_Midterm_Presentation.pptx`

---

## Key Findings

1. **DEGs**: Identified 289 genes with significant expression differences between incipient AD subjects and controls.
2. **Pathway Insights**: Enriched pathways included those related to neuronal function, synaptic signaling, and inflammatory responses.
3. **Candidate Biomarkers**: Genes such as CAMK4, SUGT1, and SMAD4 were identified as potential AD biomarkers based on their biological relevance.


