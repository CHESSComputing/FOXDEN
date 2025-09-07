# Sync service

[SyncService](https://github.com/CHESSComputing/SyncService)
is designed to sync FOXDEN records between distributed FOXDEN instances.
Its logic is based on individual synching of metadata and provenance records
between instances.

## Web interface
Sync web interface consiste of submission form 
![sync form](images/sync_form.png)
and status dashboard
![sync form](images/sync_dashboard.png)

## APIs
- GET methods
  - `/records` to fetch all sycn records
  - `/record/:uuid` to fetch individual sync record
- POST methods:
  - `/record` to add new sync record
- PUT methods:
  - `/record/:uuid` to amend already existing sync record
- DELETE methods:
  - `/record/:uuid` to delete sync record

### Example uses
- Add new records:
  ```
  curl -X POST
    -H "Content-type: application/json" \
    -H "Authorization: Bearer $token" \
    -d '{"source_token":"token", "target_token":"token", "source_url": "https://foxden...", "target_url": "http://localhost:8344"}"
    http://localhost:8388/record
  ```
- Fetch all sync records:
  ```
  curl \
    -H "Content-type: application/json" \
    -H "Authorization: bearer $token" \
    http://localhost:8388/records
  ```
- Update sync record
  ```
  curl -X PUT \
    -H "Content-type: application/json" \
    -H "Authorization: bearer $token" \
    http://localhost:8388/record/<uuid>
  ```
- Delete sync record
  ```
  curl -X DELETE \
    -H "Content-type: application/json" \
    -H "Authorization: bearer $token" \
    http://localhost:8388/record/<uuid>
  ```
