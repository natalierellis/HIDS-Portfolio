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
     - Average bar graph for immune cell fractions in precancerous and normal tissue.  
     - Stacked bar plot, line plot, and correlation plot (team contributions).  

   **Input Files**:  
   - **Note**: Input files for CIBERSORTx are no longer accessible, so replication of the CIBERSORTx analysis is not possible. However, visualizations generated from the available CIBERSORT output data can be fully replicated.  

   **Output Files**:  
   - `Ciber_Normal_AvgBarPlot.pdf`
   - `Ciber_Precancerous_AvgBarPlot.pdf`
   - The remaining visualizations completed by my other team members are included in the presentation. 

---

## Key Findings  

### Pathways and Biological Insights  

| **Pathway/Term**           | **Relevance to Bladder Cancer**                                                                                       |  
|----------------------------|------------------------------------------------------------------------------------------------------------------|  
| **TLR Cascade**            | Impaired dendritic cells suppressed immune activation, allowing the tumor to evade the immune system [1]. |  
| **MHC Class II**           | Impaired antigen presentation may weaken immune responses and contribute to BC recurrence [2]. |  
| **Cell Cycle, Mitotic**    | Abnormal mitotic activity associated with tumor progression and recurrence [3]. |  
| **RHO GTPase**             | Plays a pivotal role in regulating both tumor progression and the immune microenvironment in BC [4]. |  

---

### Immune Cell Type Insights  

**Immune Landscape in Bladder Cancer Progression**:  
- **Decreases** in key immune cells:  
  - **CD4 Memory T Cells**  
  - **M2 Macrophages**  
  - **CD8 T Cells**  
- **Increases** in:  
  - **Tregs** (Regulatory T Cells)
  - **Activated Dendritic Cells**

These immune cell dynamics highlight a disrupted immune environment promoting tumor development and recurrence.  

---

## Note  

- Input files for the CIBERSORTx analysis are no longer accessible, so the CIBERSORTx tool's analysis cannot be replicated. However, the visualizations generated from the CIBERSORTx output data, such as bar graphs and correlation plots, can be reproduced using the provided scripts and output files in the project directory.  

---

## References  

1. Ma Y, Shurin GV, Zhu Peiyuan, Shurin MR. Dendritic Cells in the Cancer Microenvironment. Journal of Cancer. 2013;4(1):36-44. doi:https://doi.org/10.7150/jca.5046
2. Sfakianos, J.P., Daza, J., Hu, Y. et al. Epithelial plasticity can generate multi-lineage phenotypes in human and murine bladder cancers. Nat Commun 11, 2540 (2020). https://doi.org/10.1038/s41467-020-16162-3
3. Mercadante AA, Kasi A. Genetics, Cancer Cell Cycle Phases. [Updated 2023 Aug 14]. In: StatPearls [Internet]. Treasure Island (FL): StatPearls Publishing; 2024 Jan-. Available from: https://www.ncbi.nlm.nih.gov/books/NBK563158/
4. Michael Zaleski, Augustyna Gogoj, Vonn Walter, et al. Mitotic activity in noninvasive papillary urothelial carcinoma: its value in predicting tumor recurrence and comparison with the contemporary 2-tier grading system, Human Pathology, Volume 84, 2019, Pages 275-282, ISSN 0046-8177, https://doi.org/10.1016/j.humpath.2018.10.008. 

