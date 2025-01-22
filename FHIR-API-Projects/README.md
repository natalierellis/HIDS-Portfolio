# HTML Projects: FHIR OpenEMR Query & Patient Data Manager

This repository contains two HTML projects that demonstrate interactions with FHIR APIs to retrieve and manage patient data. Both projects showcase dynamic web applications that utilize JavaScript, jQuery, and APIs to fetch and display healthcare information.

---

## Project Descriptions

### 1. FHIR Resource Query
- **File Name**: `fhir_openemr_query.html`
- **Description**:
  This project is designed to query and retrieve FHIR resources (e.g., patients, medications, observations, conditions, etc.) using the OpenEMR FHIR API. Users can specify resource types and patient IDs to fetch relevant JSON data. The project includes:
  - Displaying JSON data in a readable format.
  - Showing up to 20 entries for large datasets.
  - Displaying a table for medications, including details like drug name, dose, route, and timing.

- **Features**:
  - Handles multiple resource types (e.g., Medications, Conditions, Observations).
  - Displays fetched JSON data and resource-specific details (e.g., medications in a table format).
  - Provides error handling for missing or invalid data.

- **Note**: This project requires a connection to an OpenEMR FHIR server.

---

### 2. Patient Data Manager
- **File Name**: `patient_data_manager.html`
- **Description**:
  This project retrieves and displays patient demographic information, medications, and conditions using the HAPI FHIR API. Users can also update or create patient data directly in the FHIR server. Part of the code for this project was pre-written, specifically the `getMedications()` function, which was used as a template to implement the functionality for fetching patient conditions. The final implementation includes:
  - Fetching and displaying patient demographics, medications, and conditions.
  - Handling conditions with multiple codes or codings.
  - Updating or creating patient data through PUT and POST requests.

- **Features**:
  - Bootstrap-based design for enhanced UI/UX.
  - Fetches data for patients based on their IDs.
  - Lists medications and conditions in organized tables.
  - Includes buttons for creating new patients or updating existing ones.

- **Personal Contribution**:
  - Extended the existing functionality to include fetching and displaying patient conditions.
  - Adapted the `getMedications()` function as a template for implementing `getConditions()`.

