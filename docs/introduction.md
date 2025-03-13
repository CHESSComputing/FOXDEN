# Introduction

FOXDEN stands for FAIR Open-Science Extensible Data Exchange Network.

**FOXDEN** is a system of **cyberinfrastructure (CI) building blocks** designed
to support high-impact, data-intensive science through **heterogeneity,
modularity, and interoperability**. Unlike monolithic data platforms, FOXDEN
offers **loosely coupled services** that can be selectively deployed, ensuring
seamless integration with existing infrastructures and workflows. It is highly
**portable**, supporting diverse hardware architectures (AMD, ARM, Power8,
RISC) and operating systems (Linux, macOS, Windows), making it deployable at
scales ranging from personal workstations to high-performance computing (HPC)
facilities.

## Key Features

FOXDEN is designed to facilitate **collaborative reuse of datasets**, starting
with exemplary datasets and workflows at CHESS. Researchers can use FOXDEN to
**search for datasets, retrieve missing metadata, and analyze data locally or
remotely**, enabling efficient cross-facility collaboration. The system
supports **adaptive workflows**, accommodating future use cases by integrating
diverse data storage solutions and federating CI resources.

FOXDEN is structured around three interdependent components:

1. **FOXDEN Services and Workflows** – A suite of **FAIR-compliant** services
   for data collection, visualization, processing, publication, and management.  
2. **FOXDEN Federated Storage Network (FFSN)** – A distributed storage
   federation connecting partner facilities, community portals, and research
   groups, modeled after the NSF-funded **National Science Data Fabric (NSDF)**.  
3. **FOXDEN Community Building** – A comprehensive program for **education,
   training, and workforce development**, fostering an engaged community of
   users and developers for long-term sustainability.  

This repository contains documentation of **FOXDEN Services and Workflows**.

## Technical Design

FOXDEN services are **web applications written in Go**, offering **RESTful HTTP
APIs** that allow seamless data interactions without requiring specialized
client software. These services handle structured and unstructured data using
both relational and document-oriented databases, ensuring **scalability,
fault-tolerance, and long-term sustainability**. 
Clients can choose which FOXDEN services should be deployed at their
premises and easily integrate them within existing infrastructure.

A strong emphasis on **cybersecurity** ensures that FOXDEN integrates industry
best practices. Web interfaces and APIs are secured with encryption and
token-based authentication. Each token carries specific scopes for
fine-granularity access to underlying data and operations.
