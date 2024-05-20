#!/usr/bin/env python
import json
import sys

ifile = sys.argv[1]
schema = ifile.split(".json")[0]
docs = json.load(open(ifile))
for i in docs:
    desc = i.get('description', '').replace('"', '')
    units = i.get('units', '')
    dtype = i.get('type', 'string')
    print('{"service": "MetaData", "key": "%s", "description": "%s", "units": "%s", "type": "%s", "schema": "%s"},' \
            % (i["key"], desc, units, dtype, schema))
