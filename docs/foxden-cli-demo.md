# CLI demo
Here we show basic shell script demonstrating FOXDEN CLI commands.
Feel free to adapt it for your use-case:
```
#!/bin/bash
cdir=/path/FOXDEN
ddir=$cdir/DataBookkeeping
idir=$cdir/gotools/foxden/test/data
schema=ID3A

echo
echo "get write token"
token=`./foxden token create write | head -1`
export FOXDEN_WRITE_TOKEN=$token
# echo "FOXDEN_WRITE_TOKEN=$FOXDEN_WRITE_TOKEN"
echo
echo "get read token"
token=`./foxden token create read | head -1`
export FOXDEN_TOKEN=$token
# echo "FOXDEN_TOKEN=$FOXDEN_TOKEN"
echo
echo "view issued tokens"
./foxden token view

echo
echo "remove dbs.db"
rm $ddir/dbs.db
sqlite3 $ddir/dbs.db < $ddir/static/schema/sqlite.sql

echo
echo "+++ Add new meta-data record $idir/ID3A-meta1.json"
./foxden meta add $schema $idir/ID3A-meta1.json

echo
echo "+++ Add new meta-data record $idir/ID3A-meta2.json"
./foxden meta add $schema $idir/ID3A-meta2.json

echo
echo "+++ Add new dbs-data record $idir/ID3A-dbs1.json"
./foxden prov add $idir/ID3A-dbs1.json
echo
echo "+++ Add new dbs-data record $idir/ID3A-dbs2.json"
./foxden prov add $idir/ID3A-dbs2.json

echo
echo "+++ search for all records"
./foxden search {}

echo
echo "+++ view record /beamline=3a/btr=3731-b/cycle=2023-3"
./foxden view /beamline=3a/btr=3731-b/cycle=2023-3

echo
echo "+++ view records unittest"
./foxden view unittest

echo
echo "+++ test dataset id updates"
echo "+++ adding empty dbs record with some did"
did=`cat test/data/ID3A-dbs1-empty.json | grep did | awk '{print $2}' | sed -e "s,\",,g"`
./foxden prov add test/data/ID3A-dbs1-empty.json
echo "+++ list files of our did"
./foxden prov ls files --did=$did
echo "+++ update dbs record with new files"
./foxden prov add test/data/ID3A-dbs1-empty-files.json
echo "+++ list files of our did"
./foxden prov ls files --did=$did
echo "+++ update dbs record with processing info"
./foxden prov add test/data/ID3A-dbs1-empty-proc.json
echo "+++ list files of our did"
./foxden prov ls files --did=$did


echo
echo "+++ test read token for writing (must fail)"
export FOXDEN_WRITE_TOKEN=$FOXDEN_TOKEN
schema=test
./foxden meta add $schema $idir/test-data.json
```
