# Meta Data service
FOXDEN Meta Data service is responsible for handling meta-data
records. The meta-data records are stored based on pre-defined
schema file. An example of schema files you can find
[here](../configs).

Here the  main APIs:
- GET methods to retrieve meta-data information:
  - `/meta` end-point provides list of schema unit maps, each map contains schema attribute and its units key-value pairs, no authorization is required
  - `/record` end-point provides meta-data record for given `did`, no
    authorization is required
  - `/records` end-point provides all meta-data records for given
  query, requires valid authorization token
  - `/` main end-point to search for meta-data
- POST end-points:
  - `/` main end-point in inject meta-data record, required write authorization
    scope
  - `/search` end-point to search for meta-data records based on Query
    Language, requires valid authorization token
  - `/count` end-point provides number of documents for provided query,
  requires valid authorization token
- DELETE end-points:
  - `/record` end-point allows delete meta-data record, requires `delete`
    authorization token

### Examples of using meta-data service APIs
```
# record.json can be one of CHESS meta-data records

# inject new record
curl -v -X POST -H "Content-type: application/json" \
    -H "Authorization: Bearer $token" \
    -d@./record.json \
    http://localhost:8300

# perform search with pagination
curl -X POST \
    -H "Authorization: bearer $token" \
    -H "Content-type: application/json" \
    -d '{"client":"go-client","service_query":{"query":"{}","spec":null,"sql":"","idx":0,"limit":2}}' \
    http://localhost:8300/search

# retrieve concrete record with did=123456789
curl -H "Accept: application/json" \
    -H "Authorization: bearer $token" \
    http://localhost:8300/123456789
```

### Backends
The Metadata services supports setup of different backends:
- [MongoDB](https://www.mongodb.com/): document oriented database used by
  Metadata service by default. Since it is external project you need to
  properly install it on your system. In addition we highly recommend to
  setup the following indexes within MongoDB:

```
# In MongoDB it is desired to create individual indexes
# to speed up data look-up.

# if your database is called foxden.meta, then setup your indexes as following:
# Step 1: login to your MongoDB

# Step 2: use your desired database, e.g. foxden
mongo > use foxden

# Step 3: create necessary indexes

# index on did should be unique
foxden> db.meta.createIndex({did:1}, {unique: true})

# index on doi is not unique as we may have records with no DOI
foxden> db.meta.createIndex({doi:1})

# verify your indexes
foxden> db.meta.getIndexes()
```

- [Badger](https://github.com/hypermodeinc/badger): embedded key-value database
  developed by [Dgraph](https://github.com/hypermodeinc/dgraph)
- [Clover](https://github.com/ostafen/clover): a lightweight document-oriented NoSQL database written in pure Golang.
- [Tiedot](https://github.com/HouzuoGuo/tiedot/): a basic document (NoSQL) database in Go.
