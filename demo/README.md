### FOXDEN demo instance
This area contains metadata and provenance records for FOXDEN demo instance.
They can populate them at any time via the following set of commands:
```
# obtain valid kerberos credentials
kinit

# get FOXDEN tokens
foxden token create read
foxden token create write

# inject metadata records
foxden meta add meta-record1.json --schema=demo --config ~/foxden-demo.yaml
foxden meta add meta-record2.json --schema=demo --config ~/foxden-demo.yaml

# inject provenance records
foxden prov add prov-record1.json --config ~/foxden-demo.yaml
foxden prov add prov-record2.json --config ~/foxden-demo.yaml
```
