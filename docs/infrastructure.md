# FOXDEN infrastructure
![infrastructure](/images/ChessDataManagementSoftware.png)

FAIR Open-Science Extensible Data Exchange Network (FOXDEN) consists of the following components:

### Core services:
- **Data Management Service:** S3 compliant data management service for accessing raw and derived datasets
- **Data Discovery Service:** allows users to search for meta and provenance data
- **Metadata Service:** store and manage meta-data information
- **Provenance Service:** store and manage provenance information about datasets
- **SpecScans Service:** designed to store and access spec scans
- **Publication Service:** designed to create, manage and publish DOI information about CHESS data
  - We should aim to convert this service to fully complaint FAIR digitial object registry., part of FAIR digital object framework. More information can be captured from How to go FAIR document.

### Advanced Services
- **Vizualization:** data service for data vizualization
- **MLHub:** data service specifically designed for managing AI/ML models (store ML models, and associated meta-data and provides inference API)
- **CHAPBook:** data service for novice programmers with Jupyter-like interface for writing code, it is integrated with CHAP framework
- **Data Analysis:** data service provides an interface to the X-ray Imaging of Microstructures
