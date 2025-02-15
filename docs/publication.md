# FOXDEN Publication service

CHESS Publication service. Its implementation is based on
[Zenodo](https://zenodo.org) APIs, see his [blog](https://felipecrp.com/2021/01/01/uploading-to-zenodo-through-api.html)

TODO: we should aim to convert this service to fully complaint
[FAIR digitial object registry](https://fairdigitalobjectframework.org/)., part
of [FAIR digital object
framework](https://www.go-fair.org/today/fair-digital-framework/). More
information can be captured from [How to go
FAIR](https://www.go-fair.org/how-to-go-fair/) document.

### APIs
```
# to work with all APIs please obtain valid token

# list docs
curl http://localhost:port/docs

# list specific doc
curl http://localhost:port/docs/<ID>

# create new DOI resource
curl -X POST \
    -H "Authorization: bearer $token" \
    -H "Content-type: application/json" \
    -d '{}' \
    http://localhost:port/create

# add new file to our doi resource
# for that see response above for bucket UUID
curl -X PUT \
    -H "Authorization: bearer $token" \
    --upload-file bla.md \
    http://localhost:port/add/<UUID>/bla.md

# add metadata record from meta.json file
curl -X PUT \
    -H "Authorization: bearer $token" \
    -H "Content-type: application/json" \
    -d@meta.json \
    http://localhost:port/update/<ID>

# publish our record
curl -X POST \
    -H "Authorization: bearer $token" \
    http://localhost:port/publish/<ID>

```

### Zenodo REST API logic
```
# list existing records
curl https://zenodo.org/api

# create new deposit
curl -X POST 'https://zenodo.org/api/deposit/depositions?access_token=<TOKEN>' \
     -H 'Content-Type: application/json' -d '{}'

# add new file to our zenodo record
curl -X PUT \
    --upload-file readme.md \
    'https://zenodo.org/api/files/<uuid>/readme.md?access_token=<TOKEN>'
where uuid can be obtained from previous (create) step JSON, see links.bucket URI

# add mandatory metadata to our publication
curl -X PUT "https://zenodo.org/api/deposit/depositions/<ID>?access_token=<TOKEN>" \
    -H "Content-type: application/json" -d@meta.json
where ID is your Zenodo ID (see create step JSON output) and meta.json has the following form:
{
    "metadata": {
        "publication_type": "article",
        "upload_type":"publication",
        "description":"This is a test",
        "keywords": ["bla", "foo"],
        "title":"Test"
    }
}

# publish your record
curl -v -X POST "https://zenodo.org/api/deposit/depositions/<ID>/actions/publish?access_token=<TOKEN>"
```
