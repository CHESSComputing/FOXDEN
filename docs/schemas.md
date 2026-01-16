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

- **key**: Defines the metadata key
- **type**: Specifies the data type of the metadata key. The supported data-types are the following:
   - `bool` for boolean data-type
   - `int, int8, int16, int32, int64` for integer data-types of different
     precisions
   - `float32, float64` for float data types of different precisions
   - `string` for string data types
   - `list_str, list_int, list_float` for differnet list types
   - `struct` data-type represents another data structure and can be used for
     embedding another schema, see examples below
   - `list_struct` for list of embeded `struct` records
   - `any` provides support of user defined data-structures, e.g.
     dictionaries, yaml, JSON, etc.
- **optional**: A boolean flag indicating whether the metadata key is optional
- **multiple**: Indicates if the metadata key can have multiple values
- **section**: Defines the placement of the key within the web UI section
- **description**: Provides a proper description of the metadata key
- **units**: Specifies the units used for the metadata key values
- **placeholder**: Specifies the necessary placeholder string in the web UI
- **file**: Defines the full path of an embedded schema
- **value**: Defines default values of the metadata key
- **schema**: Defines another schema file name to be used with `type=struct`

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

### Example of embedded schemas
Here is an example of schema file we would like to embed

```
[
  {
    "key": "key1",
    "type": "string"
  },
  {
    "key": "key2",
    "type": "int"
  }
]
```

To embed this schema into our original one we will use the following record

```
  {
    "key": "embeded_key",
    "type": "struct",
    "schema": "ID3A_subschema.json",
    "optional": false
  },
```

Please note, we included in our schema record schema file definition
(`ID3A_subschema.json`). Our embeded record will be a map defined
this schema file.

Using this schema record definition we may have metadata record as
following:


```
{
    "did": "/beamline=3a/btr=123/...",
    "embeded_key": {"key1": "some_string_value", "key2": 1}
}
```

To accommodate more complex case let's define a new schema record with list of
embedded records (here we use `"type": "list_struct"` in a schema record to
show that we expect our values will be a list of this map records):

```
  {
    "key": "embeded_key",
    "type": "list_struct",
    "schema": "ID3A_subschema.json",
    "optional": false
  },
```

And, here we provide values of `embeded_key` as a list of `struct` defined in a
our schema (`ID3A_substructs.json`)

```
{
    "did": "/beamline=3a/btr=123/...",
    "embeded_key": [
        {"key1": "some_string_value1", "key2": 1},
        {"key1": "some_string_value2", "key2": 2}
    ]
}
```

---

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
