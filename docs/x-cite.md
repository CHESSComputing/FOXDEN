# Introduction
This tutorial is designed to walk you through physics analysis workflows
from time you collect the data to perform a final analysis. 

# FOXDEN
FOXDEN stands for FAIR Open-Science Extensible Data Exchange Network.
It is a Flexible and Federated Cyberinfrastructure for Data-Intensive Science.
Technically speaking it is set of services which will help you
to organize your data and use it for your analysis.

### Data discovery
write part about how to discover the data within FOXDEN:
- explain FOXDEN web UI
- explain web UI search
- explain FOXDEN records
  - what is did
  - what is record structure
  - how to find files

### Data injection
```
# login to lab node

# obtain kerberos ticket
kinit <user>@CLASSE.CORNELL.EDU

# list existing kerberos ticket
klist

# obtain FOXDEN tokens
foxden token create read
foxden token create write

# inject meta data record
foxden meta add demo-meta.json --schema=demo --config ~/foxden-demo.yaml
```

### Data Analysis
Explain CHAP and provide examples how to process and analyze the data.
