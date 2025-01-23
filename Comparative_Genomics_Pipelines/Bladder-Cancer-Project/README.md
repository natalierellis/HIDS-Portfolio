# Immuno-Oncology Applications of Genomic Data: Bladder Cancer Analysis  

This project explores molecular changes and immune landscape disruptions in bladder cancer (BC) through differential gene expression analysis and immune cell profiling. The focus was on comparing **precancerous bladder tissue** with **normal bladder tissue** to identify biomarkers and pathways relevant to cancer progression and recurrence.

---

## Project Overview  

**Objective**:  
- Identify differentially expressed genes (DEGs) and disrupted pathways between precancerous and normal bladder tissues.  
- Analyze changes in immune cell types infiltrating tumors using the CIBERSORTx tool.  
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
  - `input/`: Input files for visualization using CIBERSORT.  
  - `output/`: Visualizations to be included in the presentation.  
  - `scripts/`: Scripts for graph generation of CIBERSORT results.  

---

## Analysis Workflow  

### Step 1: Differential Gene Expression and Pathway Enrichment  

**Objective**: Identify DEGs between precancerous and normal tissues and perform pathway analysis.  

1. **Differential Gene Expression**  
   - Conducted T-tests for each gene to compare precancerous and normal tissue groups.  
   - Filtered DEGs based on FDR ≤ 0.01.  

   **Main Output File**:  
   - `Test1_Precancerous_vs_Normal.TTest.csv`: Full T-test results.  

2. **Pathway Enrichment Analysis**  
   - Used EnrichR to query biological databases (e.g., KEGG, Reactome, GO).  
   - Identified pathways and gene ontologies relevant to bladder cancer.  

   **Main Output Files**:  
   - `EnrichR_Results.xlsx`: Multi-tab Excel file with pathway enrichment results.  

---

### Step 2: Immune Cell Profiling  

**Objective**: Identify immune cell composition changes in bladder cancer using CIBERSORTx.  

1. **Immune Cell Analysis**  
   - Uploaded gene expression data to CIBERSORTx.  
   - Analyzed the immune landscape in precancerous and normal tissue.  

2. **Visualizations**  
   - Generated graphs to interpret immune cell dynamics:  
     - Average bar graph for immune cell fractions in tumor and normal tissue.  
     - Stacked bar plot, line plot, and correlation plot (team contributions).  

   **Input Files**:  
   - **Note**: Input files for CIBERSORTx are no longer accessible, so replication of the CIBERSORTx analysis is not possible. However, visualizations generated from the available CIBERSORT output data can be fully replicated.  

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

## Note  

- Input files for the CIBERSORTx analysis are no longer accessible, so the CIBERSORTx tool's analysis cannot be replicated. However, the visualizations generated from the CIBERSORTx output data, such as bar graphs and correlation plots, can be reproduced using the provided scripts and output files in the project directory.  

---

## References  

1. **TLR Cascade**  
   - Takeda, K., & Akira, S. (2005). Toll-like receptors in innate immunity. *International Immunology*, 17(1), 1–14.  
2. **MHC Class II**  
   - Rocha, B., et al. (2018). Antigen presentation and its role in immunity. *Nature Reviews Immunology*, 18(8), 485–498.  
3. **Cell Cycle**  
   - Malumbres, M., & Barbacid, M. (2009). Cell cycle, CDKs and cancer: A changing paradigm. *Nature Reviews Cancer*, 9, 153–166.  
4. **RHO GTPase**  
   - Ridley, A. J. (2001). Rho family proteins: Coordinating cell responses. *Trends in Cell Biology*, 11(12), 471–477.  

