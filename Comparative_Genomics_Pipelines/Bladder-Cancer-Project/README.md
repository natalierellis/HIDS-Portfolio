# Immuno-Oncology Applications of Genomic Data: Bladder Cancer Analysis  

This project explores molecular changes and immune landscape disruptions in bladder cancer (BC) through differential gene expression analysis and immune cell profiling. The focus was on comparing **precancerous bladder tissue** with **normal bladder tissue** to identify biomarkers and pathways relevant to cancer progression and recurrence.

---

## Project Overview  

**Objective**:  
- Identify differentially expressed genes (DEGs) and disrupted pathways between precancerous and normal bladder tissues.  
- Analyze changes in immune cell types infiltrating tumors using the CIBERSORT tool.  
- Visualize immune cell dynamics and relate findings to bladder cancer progression and recurrence.  

**Tools**:  
- **R**: For T-test-based DEG analysis and pathway enrichment using EnrichR.  
- **CIBERSORTx**: For immune cell profiling based on gene expression data.  
- **R Graphs**: Visualizations to interpret immune landscape changes.  

**Project Directory**:  
- **Presentation**: Contains the final PowerPoint presentation summarizing key findings and visualizations.  
- **Step1-DEG-Pathway-Analysis**: Analysis of DEGs and enriched pathways.  
  - `input/`: Input files, including clinical data and gene expression data.  
  - `output/`: Results of DEG analysis and pathway enrichment.  
  - `scripts/`: R scripts for T-test and EnrichR analyses.  
- **Step2-CIBERSORT-Analysis**: Immune cell profiling analysis.  
  - `input/`: Input files for CIBERSORTx.  
  - `output/`: CIBERSORT results (TXT, Excel, and PDF).  
  - `scripts/`: Scripts for graph generation and analysis of CIBERSORT results.  

---

## Analysis Workflow  

### Step 1: Differential Gene Expression and Pathway Enrichment  

**Objective**: Identify DEGs between precancerous and normal tissues and perform pathway analysis.  

1. **Differential Gene Expression**  
   - Conducted T-tests for each gene to compare precancerous and normal tissue groups.  
   - Filtered DEGs based on FDR ≤ 0.01.  

   **Output Files**:  
   - `Test1_Precancerous_vs_Normal.TTest.csv`: Full T-test results.  
   - `Shortlisted_DEGs.csv`: Filtered DEGs (unique gene names).  

2. **Pathway Enrichment Analysis**  
   - Used EnrichR to query biological databases (e.g., KEGG, Reactome, GO).  
   - Identified pathways and gene ontologies relevant to bladder cancer.  

   **Output Files**:  
   - `EnrichR_Results.xlsx`: Multi-tab Excel file with pathway enrichment results.  
   - `Key_Pathways.csv`: Highlighted pathways with biological relevance.  

---

### Step 2: Immune Cell Profiling  

**Objective**: Identify immune cell composition changes in bladder cancer using CIBERSORTx.  

1. **Immune Cell Analysis**  
   - Uploaded gene expression data to CIBERSORTx.  
   - Analyzed the immune landscape in precancerous and normal tissue.  

   **Output Files**:  
   - `CIBERSORT_Results.txt`: Detailed immune cell fractions.  
   - `CIBERSORT_Results.xlsx`: Immune cell fractions in Excel format.  
   - `CIBERSORT_Results.pdf`: Graphical summary from CIBERSORTx.  

2. **Visualizations**  
   - Generated graphs to interpret immune cell dynamics:  
     - Average bar graph for immune cell fractions in tumor and normal tissue.  
     - Stacked bar plot, line plot, and correlation plot (team contributions).  

   **Output Files**:  
   - `Average_Bar_Graph.pdf`  
   - `Stacked_Bar_Plot.pdf`  
   - `Line_Plot.pdf`  
   - `Correlation_Plot.pdf`  

---

## Key Findings  

### Pathways and Biological Insights  

| **Pathway/Term**           | **Relevance to Bladder Cancer**                                                                                       |  
|----------------------------|------------------------------------------------------------------------------------------------------------------|  
| **TLR Cascade**            | Plays a key role in immune activation. Altered TLR signaling may suppress anti-tumor immunity and promote tumor evasion. |  
| **MHC Class II**           | Impaired antigen presentation weakens immune responses, potentially contributing to BC recurrence. Impaired dendritic cell function suppresses immune activation, allowing the tumor to evade the immune system. |  
| **Cell Cycle, Mitotic**    | Abnormal mitotic activity is linked to tumor progression and recurrence, highlighting dysregulation in cell division. |  
| **RHO GTPase**             | Regulates both tumor progression and the immune microenvironment, playing a pivotal role in bladder cancer development. |  

---

### Immune Cell Type Insights  

**Immune Landscape in Bladder Cancer Progression**:  
- **Decreases** in key immune cells:  
  - **CD4 Memory T Cells**  
  - **M2 Macrophages**  
  - **CD8 T Cells**  
- **Increases** in:  
  - **Tregs** (Regulatory T Cells): Suppress anti-tumor immunity.  
  - **Activated Dendritic Cells**: Suggest potential immune activation despite tumor immune evasion.  

These immune cell dynamics highlight a disrupted immune environment promoting tumor development and recurrence.  

---

## How to Run the Analysis  

### Prerequisites:  
- Install required R packages: `readr`, `dplyr`, `enrichR`.  
- Have access to the CIBERSORTx web tool for immune cell profiling.  

### Steps:  
1. Clone the repository and navigate to the project directory.  
2. Run the R scripts in the `Step1-DEG-Pathway-Analysis/scripts/` directory for DEG analysis and pathway enrichment.  
3. Use the input files in `Step2-CIBERSORT-Analysis/input/` to upload data to CIBERSORTx.  
4. Use the `scripts/` folder in Step 2 to generate visualizations from CIBERSORT output.  

---

## References  

1. Kawai, T., & Akira, S. (2010). The role of pattern-recognition receptors in innate immunity: update on Toll-like receptors. *Nature Immunology, 11*(5), 373–384.  
2. Roche, P. A., & Furuta, K. (2015). The ins and outs of MHC class II-mediated antigen processing and presentation. *Nature Reviews Immunology, 15*(4), 203–216.  
3. Hanahan, D., & Weinberg, R. A. (2011). Hallmarks of cancer: the next generation. *Cell, 144*(5), 646–674.  
4. Chaffer, C. L., & Weinberg, R. A. (2011). A perspective on cancer cell metastasis. *Science, 331*(6024), 1559–1564.  
5. Etienne-Manneville, S., & Hall, A. (2002). Rho GTPases in cell biology. *Nature, 420*(6916), 629–635.  

