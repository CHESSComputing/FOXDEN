## User guide: Command Line Interface (CLI)
- Please login to any lab node, e.g. `ssh lnx201`
- Locate foxden CLI tool: `which foxden` and it should show
```
/nfs/chess/sw/chessdata/foxden
```
If you can't see `/nfs/chess/sw/chessdata/foxden` it means you need to
properly setup your PATH environment variable, e.g.
```
export PATH=$PATH:/nfs/chess/sw/chessdata
```
- obtain foxden tokens and/or inspect them
```
foxden token create read
foxden token view
```
- search for foxden records
```
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
