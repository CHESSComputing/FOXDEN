# FOXDEN Quickstart Guide

## Introduction

FOXDEN is composed of loosely coupled [services](https://github.com/orgs/CHESSComputing/repositories):  
- **Frontend**: Provides a web UI for searching and accessing contents of all services below.  
- **Authz Service**: Manages authentication and authorization.  
- **Metadata Service**: Manages dataset metadata.
- **Provenance Service**: Manages provenance information for data bookkeeping.
- **SpecScan Service**: Manages metadata for spec scans (CHESS-specific).  
- **Discovery Service**: Finds data across Metadata, Provenance, and SpecScan services.  
- **Publication Service**: Publishes data via DOI providers.  
- **Data Management Service**: Initial draft for data organization.  
- **CHAPBook**: Notebook service for composing CHESS Analysis Pipeline (CHAP) workflows.  
- **MLHub service**: Proxy for managing ML models.  

For more details, refer to the [FOXDEN architecture documentation](/docs/infrastructure.md).  

## **Getting Started**
To use FOXDEN at CHESS, you will need a [CLASSE computer account](https://wiki.classe.cornell.edu/Computing/WebHome).

You may access FOXDEN via:
- Web interface
- Command-line interface (CLI)

The recommended way to use FOXDEN is via the CLI for data injection and the web UI for data lookup.

## **Web Interface** 
1. Connect to the [CLASSE VPN](https://wiki.classe.cornell.edu/Computing/ClasseVPN) using your CLASSE credentials
2. Browse to the [FOXDEN development instance](https://foxden-dev.classe.cornell.edu:8344)
3. Click `services` to explore the available services

#### **Metadata Service**
To test the Metadata Service:
1. Browse to the [Metadata Service web interface](https://foxden-dev.classe.cornell.edu:8344/meta)
2. Select **test** schema from dropdown BEAMLINES menu
    - The test schema is defined [here](https://github.com/CHESSComputing/FOXDEN/blob/main/configs/test.json)
4. Fill out some values and submit the record
5. Try to find your record either at main page (table view) or use [the search interface](https://foxden-dev.classe.cornell.edu:8344/search).

## **Command-line Interface (CLI)**
1. [Connect to lnx201.classe.cornell.edu](https://wiki.classe.cornell.edu/Computing/LinuxSupport) and log in with your CLASSE credentials
2. Create a FOXDEN configuration file at `$HOME/.foxden-dev.yaml` and copy and paste the configuration below:
```yaml
Services:
  FrontendUrl: https://foxden-dev.classe.cornell.edu:8344
  DiscoveryUrl: https://foxden-dev.classe.cornell.edu:8320
  DataManagementUrl: https://foxden-dev.classe.cornell.edu:8340
  DataBookkeepingUrl: https://foxden-dev.classe.cornell.edu:8310
  MetaDataUrl: https://foxden-dev.classe.cornell.edu:8300
  AuthzUrl: https://foxden-dev.classe.cornell.edu:8380
  SpecScansUrl: https://foxden-dev.classe.cornell.edu:8390
  MLHubURL: https://foxden-dev.classe.cornell.edu:8350
  PublicationUrl: https://foxden-dev.classe.cornell.edu:8355
  CHAPBookUrl: http://chapbook.classe.cornell.edu:8181/
Kerberos:
  Realm: CLASSE.CORNELL.EDU
  Krb5Conf: /etc/krb5.conf
Authz:
  ClientId: client_id
```
3. Run the following commands on the command line:
```sh
# Add FOXDEN CLI to your PATH
export PATH=$PATH:/nfs/chess/sw/chessdata

# Set up FOXDEN configuration file
export FOXDEN_CONFIG=$HOME/.foxden-dev.yaml

# Obtain a Kerberos ticket
export KRB5CCNAME=FILE:$HOME/krb5cc_ccache
kinit
```
4. Now, you can run FOXDEN commands:
```sh
# Obtain FOXDEN tokens (read, write, or both)
foxden token create read

# View available FOXDEN tokens
foxden token view

# Token management help
foxden token --help

# Manage metadata records
foxden meta --help

# Search for data in FOXDEN
foxden search --help

# Manage provenance records
foxden prov --help
```

## **Request your own Metadata schema**
1. Please read the [integration instructions](/docs/integration.md)
2. View the available [schemas](/configs) (e.g. [ID1A3.json](/configs/ID1A3.json), [ID3A.json](/configs/ID3A.json), etc.)
3. Fork the [FOXDEN repo](/) and check in a new .json file with your schema to the /configs directory
4. Submit a pull request
    - After the pull request is merged into the main branch, your new schema will be available in both web and command-line interfaces

## **Real-Case Scenario**  
You can use an existing schema (e.g., **3A**) to construct metadata and provenance records, inject them into FOXDEN, and later retrieve them.  

For detailed examples, see:  
- [Demo script](https://github.com/CHESSComputing/gotools/blob/main/foxden/test/demo.sh)  
- [Integration test script](https://github.com/CHESSComputing/gotools/blob/main/foxden/test/run.sh)  
