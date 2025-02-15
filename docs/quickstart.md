# FOXDEN quick start guide

### Introduction

FOXDEN is composed by loosely coupled services [0]:
- Frontend: provides web UI to all service
- Authz service: serves authentication and authorization
- MetaData service: meta-data service for storing and querying meta-data
- Provenance service: data bookkeeping service for managing provenance information
- SpecScan service: dedicated service to manage spec scans (CHESS specific)
- Discovery service: data discovery service which finds data across (MetaData, Provenance, and SpecScan)
- Publication service: for publishing your data via DOI providers
- Data Management service: initial draft of data management service
- CHAPBook: notebook service for CHAP
- MLHub service: proxy service for managing ML models
The architecture of FOXDEN and its implementation can be found here [1]

### web and CLI setup
To communicate with FOXDEN you may use either web UI, the FOXDEN frontend, or
CLI (Command Line Interface), see tools/foxden executable in [2].

To start with web interface go to
https://foxden-dev.classe.cornell.edu:8344/
You may explore different services at
https://foxden-dev.classe.cornell.edu:8344/services
for example, meta-data interface is located at
https://foxden-dev.classe.cornell.edu:8344/meta

The preferred way (and currently used in CHESS) is to use CLI for data
injection and use web UI for data-lookup, even though both provides
identical interfaces.

To use `foxden` CLI you need the following:
- account on lnxXXX node
- setup your kerberos ticket and/or have valid foxden token
- explore `foxden --help` options to get familiar with CLI tool
- FOXDEN configuration file to work with our dev instanace:
```
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
  Krb5Conf:  /etc/krb5.conf
Authz:
  ClientId: client_id
```

Here are just few examples how to start using foxden CLI:
```
# the foxden tool is located in /nfs/chess/sw/chessdata/foxden, to simplify
# you setup just setup your PATH accordingly
export PATH=$PATH:/nfs/chess/sw/chessdata

# setup FOXDEN configuration file
export FOXDEN_CONFIG=$HOME/.foxden-dev.yaml

# obtain kerberos ticket
export KRB5CCNAME=FILE:$HOME/krb5cc_ccache
kinit

# obtain FOXDEN tokens, read or write or both
foxden token create read

# view your tokens
foxden token view

# foxden token examples
foxden token --help

# manage your meta-data records, see examples in
foxden meta --help

# look-up back data from FOXDEN, see examples in
foxden search --help

# manage your provenance info, see examples in 
foxden prov --help
```

### Real case scenario
You may use one of the existing schemas, e.g. 3A and construct your meta-data,
provenance records and inject them into FOXDEN and then look them up, see
examples in [4] and [5].

Best regards,
Valentin.

[0] https://github.com/orgs/CHESSComputing/repositories
[1] https://foxden-dev.classe.cornell.edu:8344/docs/infrastructure.md
[2] https://github.com/CHESSComputing/gotools/releases/tag/v0.2.0d
[3] https://github.com/CHESSComputing/FOXDEN/tree/main/configs
[4] https://github.com/CHESSComputing/gotools/blob/main/foxden/test/demo.sh
[5] https://github.com/CHESSComputing/gotools/blob/main/foxden/test/run.sh
