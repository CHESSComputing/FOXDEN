# SpecScan service

[SpecScan](https://github.com/CHESSComputing/SpecScansService)
service for managing records of individual spec scans.
Spec scan records follow a schema, defined here: [schema](https://github.com/CHESSComputing/SpecScansService/blob/main/static/schema.json).

## APIs
- POST methods:
  - `/add` to add new scan records
  - `/search` to perform queries among existing scan records
- PUT methods:
  - `/edit` to amend values of existing scan records

### Example uses
- Add new records:
  ```
  curl -X POST
    -H "Content-type: application/json" \
    -H "Authorization: Bearer $token" \
    -d@scanrecords.json \
    http://localhost:8390/add
  ```
- Search for records:
  ```
  curl -X POST \
    -H "Content-type: application/json" \
    -H "Authorization: bearer $token" \
    -d '{"service_query":{"query":"{}"}}' \
    http://localhost:8390/search
  ```
- Edit exiting records:
  ```
    curl -X PUT \
    -H "Content-type: application/json" \
    -H "Authorization: bearer $token" \
    -d '{"spec_file": "/path/to/spec_file", "scan_number": 1, "status": "Completed"}' \
    http://localhost:8390/edit
  ```
