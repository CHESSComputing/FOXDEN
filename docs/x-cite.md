# Data discovery
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
