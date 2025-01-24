# Patient Mortality Prediction: An End-to-End Machine Learning Pipeline

This repository contains an end-to-end machine learning pipeline designed to predict patient mortality within 180 days of their last recorded medical exam. The project was part of the HIDS 6001: Massive Health Data Fundamentals course and was based on the Synthetic Public Use File (SynPUF) dataset organized under the OMOP Common Data Model. 

## Project Overview

The goal of this project was to leverage synthetic healthcare data to:
1. Predict patient mortality within 180 days of their last medical exam.
2. Evaluate the impact of various feature groups on model performance.
3. Provide insights into the most critical predictors of mortality through feature importance analysis.

The repository includes:
- **Machine learning pipeline**: For data preprocessing, feature engineering, and model training.
- **Evaluation results**: Metrics and visualizations comparing Logistic Regression and Random Forest Classifier performance.
- **Presentation and Report**: Final project presentation and detailed report.

---

## Folder Structure

- **ML_pipeline.ipynb**: End-to-end Jupyter Notebook for data preprocessing, feature engineering, model training, and evaluation.
- **Patient Mortality Prediction Report.docx**: Detailed project report, including methodology, results, and individual contributions.
- **Presentation.pptx**: Final presentation slides summarizing the project, methodology, and results.
- **Data**: The dataset can be accessed via [Google Drive](https://drive.google.com/drive/folders/1Pn6g0UfdSzATDrFK0Fyv2bkT-6oOeNQs?usp=drive_link).

---

## Methodology

### Data Preprocessing
- Loaded and merged EHR data tables (e.g., `person`, `visit_occurrence`, `condition_occurrence`, `drug_exposure`, `death`) with corresponding concept tables for human-readable descriptions.
- Removed columns with excessive missing values and excluded invalid or redundant entries.

### Feature Engineering
- Extracted and encoded features into structured formats, including:
  - **Demographics**: Age, gender, race (binary encoding).
  - **Conditions**: Myocardial Infarction, Congestive Heart Failure, etc. (binary features based on Charlson Comorbidity Index).
  - **High-Risk Admissions**: ICU, hospice, and palliative care admissions (binary flags).
  - **Medications**: Categorized drug exposures into cancer drugs, palliative care drugs, etc.
- Created three feature groups for model training:
  1. Demographics only.
  2. Demographics + Conditions.
  3. Full feature set (demographics, conditions, high-risk admissions, and medications).

### Models
- **Logistic Regression**: Configured with `class_weight='balanced'` to address class imbalance.
- **Random Forest Classifier**: Configured with `class_weight='balanced_subsample'` and fine-tuned using grid search.

---

## Results

### Model Performance

| Feature Group               | Model               | Precision | Recall | F1-Score | AUC-ROC |
|-----------------------------|---------------------|-----------|--------|----------|---------|
| **Demographics**           | Logistic Regression | 0.01      | 0.59   | 0.02     | 0.683   |
|                             | Random Forest       | 0.01      | 0.35   | 0.02     | 0.606   |
| **Demographics + Conditions** | Logistic Regression | 0.01      | 0.53   | 0.02     | 0.662   |
|                             | Random Forest       | 0.01      | 0.24   | 0.02     | 0.563   |
| **Full Feature Set**        | Logistic Regression | 0.01      | 0.53   | 0.02     | 0.657   |
|                             | Random Forest       | 0.01      | 0.16   | 0.02     | 0.542   |

### Key Insights
- **Logistic Regression** consistently outperformed Random Forest across all feature groups, achieving the highest AUC-ROC score of 0.683 with demographic features alone.
- Adding condition and medication features did not significantly improve model performance.
- Feature importance analysis revealed that **age** was the most predictive feature, while gender and race had minimal impact.

### Future Improvements
- Implement resampling techniques such as SMOTE or undersampling to address class imbalance.
- Explore additional features, such as chronic disease progression patterns and time intervals between visits.
- Experiment with advanced models like XGBoost or LightGBM.

---

## Tools and Skills
- **Languages**: Python (pandas, numpy, scikit-learn).
- **Modeling**: Logistic Regression, Random Forest Classifier.
- **Evaluation Metrics**: Precision, Recall, F1-Score, AUC-ROC.
- **Feature Engineering**: Binary encoding, condition grouping, and medication categorization.
- **Visualization**: Feature importance analysis, AUC-ROC plots.

---

## Data Access
Due to file size constraints, the dataset is hosted externally. Please download the dataset from the following link: [Google Drive](https://drive.google.com/drive/folders/1Pn6g0UfdSzATDrFK0Fyv2bkT-6oOeNQs?usp=drive_link).

---

## Individual Contributions
- **Natalie Ellis**: Performed exploratory data analysis, identified high-risk admissions, analyzed medications, and created binary flags. Ran models for Feature Group 2 and contributed to the presentation and final report.
- **Hanane Bousfoul**: Calculated the outcome variable, grouped conditions of interest, and merged demographic data. Analyzed model results and contributed to the presentation and report.
- **Austin Cherian**: Extracted the age feature, ran logistic regression and random forest models, performed hyperparameter tuning, and conducted feature importance analysis. Contributed to the presentation and report.

---

## References
1. Bionetworks S. EHR DREAM Challenge - Patient Mortality Prediction. Synapse.org. Published 2024. Accessed December 21, 2024. [EHR DREAM Challenge](https://www.synapse.org/Synapse:syn18405991/wiki/589657)
2. Charlson Comorbidity Index (CCI). MDCalc. Published 2024. Accessed December 21, 2024. [Charlson Comorbidity Index](https://www.mdcalc.com/calc/3917/charlson-comorbidity-index-cci)

