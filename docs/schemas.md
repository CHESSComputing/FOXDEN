# FOXDEN Schemas
While FOXDEN accepts metadata records in JSON format, we enforce metadata
schemas to ensure consistency across users' records. At CHESS, individual
beamlines provide and control their own schema files. Note that we separate
metadata schema files from provenance data. The former defines high-level
metadata stored in a document-oriented database, whereas provenance records are
stored in a relational database with schemas defined by the FOXDEN development
team.

### FOXDEN Metadata Schemas
A schema file is a JSON list of records, where each record should provide the
following attributes:

- `key`: Defines the metadata key
- `type`: Specifies the data type of the metadata key (e.g., string, int, float). List data types such as "list_str" are also supported
- `optional`: A boolean flag indicating whether the metadata key is optional
- `multiple`: Indicates if the metadata key can have multiple values
- `section`: Defines the placement of the key within the web UI section
- `description`: Provides a proper description of the metadata key
- `units`: Specifies the units used for the metadata key values
- `placeholder`: Specifies the necessary placeholder string in the web UI
- `file`: Defines the full path of an embedded schema

For example, here is a schema definition file:

```
[
  {
    "file": "/path/to/embedded/schema.json"
  },
  {
    "key": "did",
    "type": "string",
    "optional": true,
    "multiple": false,
    "section": "User",
    "description": "Dataset Identifier",
    "units": "",
    "placeholder": "CHESS"
  },
  {
    "key": "beamline",
    "type": "list_str",
    "optional": false,
    "multiple": false,
    "section": "User",
    "description": "Beamline description",
    "units": "",
    "placeholder": "3A",
    "value": ["1A3", "2A"]
  },
  ...
]
```

Concrete CHESS beamline schemas can be found in FOXDEN configuration repository
over [here](https://github.com/CHESSComputing/FOXDEN/tree/main/configs).

### FOXDEN Provenance Schemas
To manage provenance information, we rely on a relational database and thus use
a relational schema for data provenance. The provenance attributes include:

- File information such as file names, size, and hash sums
- OS information such as the name of the operating system and kernel version
- Environment information such as the list of Python packages used in analysis, along with Python package information (e.g., version, repository)
- Configuration information used by physicists
- Scripts defining information about scripts used in analysis
- Processing information outlining details of the processing workflow chain
- Sites and buckets storing information about data locations

Please refer to [provenance schema](https://github.com/CHESSComputing/DataBookkeeping/blob/main/static/schema/sqlite.sql)
for contrete details. We support SQLite and MySQL (MariaDB) backend.
