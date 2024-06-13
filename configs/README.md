# FOXDEN configuration files
This directory contains set of FOXDEN configuration files used by various
services:

### MetaData files
- `ID1A3.json` schema file for ID1A3 beamline
- `ID3A.json` schema file for ID3A beamline
- `ID4B.json` schema file for ID4B beamline
- `test.json` test schema file
Lexicon file:
- `metadata_lexicon.json` is a meta-data lexicon file which contains regexp
  rules for various meta-data attribute values
- `web_form_sections.json` is a web form UI file for grouping various
  attributes into appropriate sections

### Provenance files
- `dbs_lexicon.json` is a provenance lexicon file

### QL files
- `service_map_file.json` is a Query Language (QL) mapping file

### QL Map file
FOXDEN uses QL map file for auto-completion of users' keys. This file can be
generated from MetaData schema files and combine QL keys from all FOXDEN
services. Please run `./update_srv_map.sh` script to generate new
`service_map_file.json`.
