# Demonstration
In this tutorial we'll use FOXDEN CLI and web UI to demonstrate basic usage of
FOXDEN.

### FOXDEN web UI
The FOXDEN web UI tutorial can be found over [here](web.md). Here we only
demonstrate the service page with `demo` schema:
[web UI](images/web-ui-demo.md)


### FOXDEN Command Line interface
```
# obtain kerberos ticket
kinit <userid>@CLASSE.CORNELL.EDU

# check out if you have valid ticket
klist
Ticket cache: FILE:/tmp/krb5cc_502
Default principal: <userid>@CLASSE.CORNELL.EDU

Valid starting       Expires              Service principal
02/26/2025 13:14:37  03/05/2025 13:14:33  krbtgt/CLASSE.CORNELL.EDU@CLASSE.CORNELL.EDU
        renew until 03/05/2025 13:14:33

# create foxden tokens: read and write permissions
foxden token create read
foxden token create write

# view foxden tokens
foxden token view

# inject meta data record using demo schema
foxden meta add test/data/demo-meta.json --schema=demo
SUCCESS: record was successfully added with did
/beamline=demo/facility=test/energy=123

# look-up meta-data records
foxden meta ls
---
did        : /beamline=demo/facility=test/energy=123
schema     : demo
cycle      : <nil>
beamline   : [3A 3B]
btr        : <nil>
sample_name: <nil>
date       : 2025-02-26T13:15:39-05:00
---
...

# look-up meta records in json format
foxden meta ls --json

# view your record
foxden meta view /beamline=demo/facility=test/energy=123
---
{
  "_id": "67bf5a4b992e58eec639465a",
  "beam_energy": 123.456,
  "beamline": [
    "3A",
    "3B"
  ],
  "date": 1740593739,
  "did": "/beamline=demo/facility=test/energy=123",
  "facility": "test",
  "schema": "demo",
  "schema_file": "/Users/vk/Work/CHESS/FOXDEN/FOXDEN/configs/demo.json"
}
---

```
