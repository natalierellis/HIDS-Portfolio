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

### Pathways and Biological Insights

| **Pathway/Term**                            | **Relevance to AD**                                                                            |
|---------------------------------------------|-----------------------------------------------------------------------------------------------|
| **Adherens Junction**                       | Critical for maintaining neuronal cell-cell adhesion and synaptic integrity [1].                  |
| **Wnt/β-catenin Signaling in Brain**        | Essential for neuronal development, differentiation, and survival. Implicated in synaptic plasticity [2]. |
| **Interleukin-6 Signaling**                 | Implicated in inflammation and neuronal apoptosis. Consistently appeared across databases [3]. |
| **Neuronal System**                         | Key organ system affected in AD, essential for synaptic signaling. High overlap in Reactome [4]. |
| **cAMP Signaling**                          | Linked to neuronal apoptosis and synaptic plasticity. High overlap in KEGG [5].               |

### Gene-Level Insights

- **FZD8 (Wnt/β-catenin)**: Upregulated; supports neuronal connections. Limited direct link to AD, more associated with cancer pathways.
- **SMAD4**: Mixed regulation suggests complex roles in early-stage AD.
- **TCF7L1 (Wnt/β-catenin)**: Results contradict literature, suggesting potential compensatory mechanisms in incipient AD.

## References

1. Zenaro E., Piacentino, G., Constantin, G. (2017). The blood-brain barrier in Alzheimer's disease. Neurobiology of Disease 107,41-56. https://doi.org/10.1016/j.nbd.2016.07.007
2.  Nagu, P., Sharma, V., Behl, T. et al. (2022). Molecular Insights to the Wnt Signaling During Alzheimer’s Disorder: a Potential Target for Therapeutic Interventions. J Mol Neurosci 72, 679–690. https://doi.org/10.1007/s12031-021-01940-5
3. Kaurani, L., Pradhan R., Schroder, S. et al. (2024).A role for astrocytic miR-129-5p in Frontotemporal Dementia. bioRxiv. https://doi.org/10.1101/2024.04.15.589528
4. Yu, H., Ding, Y., Wei, Y., Dyrba, M., Wang, D., Kang, X., Xu, W., Zhao, K., Liu, Y., & for the Alzheimer's Disease Neuroimaging Initiative (2023). Morphological connectivity differences in Alzheimer's disease correlate with gene transcription and cell-type. Human Brain Mapping, 44(18), 6364–6374. https://doi.org/10.1002/hbm.26512
5. Li, H., Yang S., Wul, J. et al. (2017).cAMP/PKA signaling pathway contributes to neuronal apoptosis via regulating IDE expression in a mixed model of type 2 diabetes and Alzheimer's disease. J Cellular Biochemistry 119(2), 1616–1626. https://doi.org/10.1002/jcb.26321

