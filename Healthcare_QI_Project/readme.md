# Final Project: Essential Hypertension Management Deficiency

This repository contains materials and deliverables for a final project aimed at improving the management of essential hypertension at a simulated hospital using data-driven interventions and EMR modifications.

---

## **Project Overview**

### **Objective**
To reduce unnecessary hypertension clinic referrals by:
1. Identifying gaps in primary care management using **Synthea** data.
2. Implementing an EMR intervention via **OpenEMR** to improve referral workflows.
3. Tracking the impact of our intervention using **Tableau dashboards**.

---

## **Roles and Contributions**

Our team of three worked collaboratively on this project:
- **Natalie Ellis (Reporting Analyst)**: Developed Tableau dashboards to track and visualize referral workflows and pilot results.
- **Austin Cherian (Quality Improvement Analyst)**: Conducted data analysis on the Synthea dataset to identify gaps in hypertension care.
- **David Angel (EMR Developer)**: Implemented workflow modifications in OpenEMR to improve referral efficiency.

All members shared responsibilities as project managers to coordinate tasks and compile deliverables.

---

## **Key Components**

### **1. Problem Statement**
The hypertension clinic faces overwhelming patient volumes due to preventable referrals from primary care. Key issues include:
- Inefficient primary care management of hypertension.
- Overwhelming patient backlog at specialty clinics.

**Solution:** Enhance referral workflows by implementing stricter referral criteria within the EMR and tracking key performance indicators (KPIs).

---

### **2. Data Analysis (Synthea)**
- **Goal:** Assess primary care management for hypertension patients and identify gaps.
- **Findings:**
   - 100% of referred patients met "adequate primary care" criteria but did not meet stricter clinical guidelines for referral.
   - Stricter referral criteria were implemented based on **British and Irish Hypertension Society Guidelines**.
   - Based on the more stringent referral criteria, 93.24% of the hypertension cohort were inapproporaitely referred to a hypertension clinic.


---

### **3. OpenEMR Intervention**
- **Goal:** Create a structured referral process in the EMR.
- **Modifications:**
  - Added a "Hypertension Management Form" requiring:
    - Lifestyle intervention documentation (e.g., diet, exercise).
    - Antihypertensive medication prescription.
    - Validation by clinical staff.
  - Integrated workflow checks to prevent inappropriate referrals.

---

### **4. Tableau Dashboard**
- **Goal:** Visualize key performance indicators (KPIs) to measure intervention success.
- **KPIs Tracked:**
  - **Inappropriate Referral Rate:** Percentage of referrals made without meeting strict criteria.
  - **Provider Adherence:** Percentage of providers following proper patient management protocols before referring.

**Features:**
- Bar charts to show trends in inappropriate referrals pre- and post-intervention.
- Line charts tracking provider adherence over time.

---

## **Key Deliverables**

| Component               | Description                                             |
|-------------------------|---------------------------------------------------------|
| **Synthea Data Analysis** | Analysis of referral workflows and gaps in care.        |
| **OpenEMR Workflow**     | Implemented stricter referral workflow in OpenEMR.      |
| **Tableau Dashboard**    | Interactive dashboard to track KPIs for decision-making. |
| **Presentation**         | Final PowerPoint summarizing findings and recommendations. |

---
## **Next Steps**
1. Expand the intervention hospital-wide.
2. Enhance the Tableau dashboard to include real-time insights.
3. Gather feedback from users to refine the workflow further.

---

## **Repository Contents**

| Folder                  | Description                                             |
|-------------------------|---------------------------------------------------------|
| `HIDS 6002 Final Presentation.pdf`               | Final presentation slides summarizing findings.         |
| `/tableau_dashboards`    | Tableau workbook and dashboard screenshots.             |
| `Workflow.xlsx` | Screenshots and files for OpenEMR modifications.        |
| `Patients_Database.xlsx`                | Placeholder for fabricated data from Synthea.           |
| `synthea_script.html`              | Data analysis scripts (e.g., Synthea cohort analysis).  |

---
## **Takeaways**
Through this project, we gained experience with:
- **Synthea:** Generating synthetic healthcare data and identifying gaps in care.
- **OpenEMR:** Modifying an EMR system to address workflow inefficiencies.
- **Tableau:** Designing actionable dashboards to track performance metrics.
- **Team Collaboration:** Managing tasks across data analysis, EMR development, and visualization.


