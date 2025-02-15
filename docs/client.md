# Command Line Tool
The official command line tool is called *foxden*.

```
foxden command line tool
Complete documentation at https://github.com/CHESSComputing/FOXDEN

Usage:
  foxden [command]

Available Commands:
  completion  Generate the autocompletion script for the specified shell
  config      foxden config commamd
  describe    foxden describe command
  doi         foxden doi command
  help        Help about any command
  meta        foxden MetaData commands
  ml          foxden ml commands
  prov        foxden provenance commands
  s3          foxden s3 commands
  search      foxden search commands
  sync        foxden sync command
  token       foxden token commands
  version     foxden version commamd
  view        foxden view commands

Flags:
      --config string   config file (default is $HOME/.foxden.yaml)
  -h, --help            help for foxden
      --verbose int     verbosity level)

Use "foxden [command] --help" for more information about a command.
```

### Search for data
To use this tool user must obtain valid kerberos ticket
```
# get kerberos ticket
kinit <user>@CLASSE.CORNELL.EDU

# obtain CHESS Data Management Token
foxden auth token /tmp/krb5cc_502

# your token will be as following
eyJh...

# set your CHESS_TOKEN environment
export CHESS_TOKEN=eyJh...
```

Now we can search for some data:
```
# get meta-data records
foxden meta ls {}
---
DID     : 1702410249514460928
Schema  : ID3A
Cycle   : 2023-3
Beamline: [3A]
BTR     : 3731-b
....

# get concrete metadata record
foxden meta view 1702410249514460928
```

Or, you may use data discoveru search
```
# get all meta-data records
foxden search {}
```

### Add new data
```
# add new meta-data record (defined in meta.json file) for ID3A schame
foxden meta add ID3A /path/meta.json

# add new provenance record defined in dbs.json file
foxden prov add /path/dbs.json
```
