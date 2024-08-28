#!/bin/bash
echo "[" > service_map_file.json
./schema2ql.py ID1A3.json >> service_map_file.json
./schema2ql.py ID3A.json  >> service_map_file.json
./schema2ql.py ID4B.json  >> service_map_file.json
cat << EOF > /tmp/ql.keys
{"service": "SpecScans", "key": "sid", "description": "Scan ID", "units": "", "type": "float64", "db": "mongo"},
{"service": "SpecScans", "key": "did", "description": "Dataset IDentifier", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "cycle", "description": "Specify cycle (e.g. 2022-3)", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "beamline", "description": "Specify beamline", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "btr", "description": "Beamtime request ID", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "spec_file", "description": "Name of SPEC data file", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "scan_number", "description": "Scan number in the SPEC data file", "units": "", "type": "int8", "db": "mongo"},
{"service": "SpecScans", "key": "start_time", "description": "Start time of the scan (as epoch)", "units": "seconds", "type": "float64", "db": "mongo"},
{"service": "SpecScans", "key": "command", "description": "Command used to run the scan", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "status", "description": "Scan status (running, completed, aborted, or n/a)", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "comments", "description": "Comment line from the SPEC data file", "units": "", "type": "list_str", "db": "mongo"},
{"service": "SpecScans", "key": "spec_version", "description": "SPEC version identifier", "units": "", "type": "string", "db": "mongo"},
{"service": "SpecScans", "key": "epics_pvs", "description": "EPICS PV values", "units": "", "type": "dict", "db": "mongo"},
{"service": "SpecScans", "key": "motors", "description": "Static motor position values for all configured motors at the start of the scan", "units": "", "type": "dict", "db": "sql"},
{"service":"Provenance", "key":"version", "description":"sofware version", "type":"string"},
{"service":"Provenance", "key":"file", "description":"file name", "type":"string"},
{"service":"Provenance", "key":"did", "description":"dataset id", "type":"string"},
{"service":"DataManagement", "key":"storage", "description":"storage bucket name", "type":"string"}
EOF
cat /tmp/ql.keys >> service_map_file.json
echo "]" >> service_map_file.json
