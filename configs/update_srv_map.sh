#!/bin/bash
echo "[" > service_map_file.json
./schema2ql.py ID1A3.json >> service_map_file.json
./schema2ql.py ID3A.json  >> service_map_file.json
./schema2ql.py ID4B.json  >> service_map_file.json
cat << EOF > /tmp/ql.keys
{"service":"SpecScans", "key":"did", "description":"dataset id", "type":"string"},
{"service":"SpecScans", "key":"motor_name", "description":"motor name", "units": "degree or mm", "type":"string"},
{"service":"SpecScans", "key":"motor_position", "description":"motor position","units":"units of motor name", "type":"string"},
{"service":"Provenance", "key":"version", "description":"sofware version", "type":"string"},
{"service":"Provenance", "key":"file", "description":"file name", "type":"string"},
{"service":"Provenance", "key":"did", "description":"dataset id", "type":"string"},
{"service":"DataManagement", "key":"storage", "description":"storage bucket name", "type":"string"}
EOF
cat /tmp/ql.keys >> service_map_file.json
echo "]" >> service_map_file.json
