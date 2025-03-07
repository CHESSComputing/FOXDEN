# Integration guidelines
This document provides integration guidelines to include new
beamline (or any other experiment or data set) into FOXDEN.

<br/>

**Step 1:** prepare new FOXDEN schema for your beamline or data set.
The schema represents series of JSON records which key, its data-type,
descriptions, units, etc. For example here is an example of did
key:
```
[
  {
    "key": "did",
    "type": "string",
    "optional": true,
    "multiple": false,
    "section": "User",
    "description": "Dataset IDentifier",
    "units": "",
    "placeholder": "CHESS"
  },
  ...
]
```

<br/>

**Step 2:** request inclusion of your schema into FOXDEN by providing
git pull request to [FOXDEN](https://github.com/CHESSComputing/FOXDEN)
repository or contacting FOXDEN developers team

<br/>

**Step 3:** prepare your meta-data record(s) which satisfies your schema,
e.g.
```
{"did": "/beamline=XXX/...", ...}
```

<br/>

**Step 4:** once your schema is present in FOXDEN you may inject your
meta-data record(s) using `foxden` CLI to FOXDEN dev instance, e.g.
```
# set FOXDEN config to point to dev instance
export FOXDEN_CONFIG=/nfs/chess/user/chess_chapaas/.foxden-dev.yaml

# obtain write token
foxden token create write

# add meta-data record with given schema and did attributes
foxden meta add <file.json> --schema=<schema> --did-attrs=beamline,btr,cycle,sample_name

# the same as above if your did attributes are beamline,btr,cycle,sample_name
foxden meta add <file.json> --schema=<schema>
```

<br/>

**Step 5:** once your data is in FOXDEN you may look it up via the following
commands:
```
# list all known search keys:
foxden search keys

# search CHESS data using query language, e.g. empty query match all records
foxden search {}

# same as above but provide output in JSON data-format:
foxden search {} --json

# search using query language,
# provide valid JSON use single quotes around it and double quotes for key:value pairs
foxden search '{"PI":"name"}'

# search using key:value pairs, e.g. pi:name where 'pi' is record key and 'name' would be PI user name
# keys can be in lower case, e.g. pi instead of PI used in meta-data record
foxden search pi:name

# same as above but provide output in JSON data-format:
foxden search pi:name --json
```
