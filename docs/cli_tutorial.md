# FOXDEN tutorial
In this tutorial we'll use FOXDEN CLI and web UI to demonstrate basic usage of
FOXDEN.

### FOXDEN web UI
The FOXDEN web UI tutorial can be found over [here](https://chesscomputing.github.io/FOXDEN/docs/web.html). Here we only
demonstrate the service page with [`demo` schema](https://github.com/CHESSComputing/FOXDEN/blob/main/configs/demo.json)


### FOXDEN Command Line interface
```
# explore foxden command
foxden --help
foxden <command> --help
```

To work with FOXDEN we need a token. The individual token can be used for read and write operations. To obtain a token we first need to get kerberos ticket (perform lab authentication):
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
```

Now, with existing kerberos ticket we are ready to obtain FOXDEN token:
```
# create foxden tokens: read and write permissions
foxden token create read
foxden token create write

# view foxden tokens
foxden token view
```

### Meta-data operations
We'll use the following meta data records
- record I: data representing RAW data
```
{
    "did": "/beamline=3a/btr=testbtr/cycle=testcycle/sample_name=testsample/user=test",
    "facility": "test",
    "beamline": ["3A", "3B"],
    "btr": "testbtr",
    "cycle": "testcycle",
    "sample_name": "testsample",
    "data_location_raw": "/tmp",
    "beam_energy": 123.456
}
```
- record II: data representing analysis data
```
{
    "did": "/beamline=3a/btr=testbtr/cycle=testcycle/sample_name=testsample/user=test/child=true",
    "facility": "test",
    "beamline": ["3A"],
    "btr": "testbtr",
    "cycle": "testcycle",
    "sample_name": "testsample",
    "data_location_raw": "/tmp",
    "beam_energy": 987.654
}
```

#### meta-data injection
```
# explore meta command help
foxden meta --help

# inject meta data record using demo schema
foxden meta add demo-meta.json --schema=demo --config ~/foxden-demo.yaml
foxden meta add demo-meta-child.json --schema=demo --config ~/foxden-demo.yaml
```

#### meta-data lookup
```
# list existing met-data records
foxden meta ls

# look-up meta records in json format
foxden meta ls --json

# view your record
foxden meta view /beamline=demo/facility=test/energy=123
```

#### provenance injection
```
# explore prov command help
foxden prov --help

# inject provenance information
foxden prov add demo-prov.json --config=~/.foxden-demo.yaml
foxden prov add demo-prov-child.json --config=~/.foxden-demo.yaml
```

#### provenance data look-up
```
# set your favorit did
did=...
# look-up data in provenance
foxden prov ls provenance --did=$did

# explore more options
foxden prov --help
```
