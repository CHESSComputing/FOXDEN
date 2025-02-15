# FOXDEN API toolkit
Below we provide description of individual FOXDEN services APIs.

### Frontend service
Fronend service provides HTTP end-points for the following actions:
- project regiratation
- site registration
- dataset registration
- dataset upload
- file upload
- delete dataset
- delete file

Here is a list of implemented APIs:
- HTTP GET
   - `/docs` provides access to all static documents
   - `/login` provides login form
   - `/logout` logout action
   - `/user/registration` provides user registration form
   - `/datasets` list all available datasets
   - `/dataset/:dataset` provides details of individual dataset
   - `/meta` provides all meta-data records
   - `/meta/record/:mid` provides meta-data record for given meta-data id
   - `/meta/:site` provides meta-data records for specified site
   - `/sites` get list of all participated sites
   - `/site/:site` get specific site info
   - `/storage/:site` get S3 bucket info for a given site
   - `/storage/:site/:bucket` get objects from S3 bucket info for a given site
   - `/storage/:site/create` creates new bucket on S3 storage for a given site
   - `/storage/:site/upload` upload data to S3 storage for a given site
   - `/storage/:site/delete` delets bucket on S3 storage for a given site
   - `/analytics`
   - `/discovery`
   - `/provenance`
   - `/project`

- HTTP PUT
- HTTP POST
    - `/user/registration` creates new user
    - `/project/registration` creates new project
    - `/site/registration` creates new site record
    - `/data/registration` creates new data record
    - `/storage/create` creates new S3 storage bucket
    - `/storage/upload` upload data to S3 storage bucket
    - `/storage/delete` delete data from S3 storage bucket
    - `/meta/upload` upload meta-data record
    - `/meta/delete` deletes meta-data record
    - `/data/upload` upload data object
    - `/data/delete` deletes data object
- HTTP DELETE


### Discovery service
- HTTP GET
    - `/sites` list all participated sites
- HTTP PUT
- HTTP POST
    - `/site/:site` create new site record for given site name
- HTTP DELETE
    - `/site/:site` delete site record for given site name

### MetaData service
- HTTP GET
    - `/meta` list all meta-data records
    - `/meta/record/:mid` get meta-data record for given id
    - `/meta/:site` get meta-data record for given site
- HTTP PUT
- HTTP POST
- HTTP DELETE
    - `/meta/:mid` delete meta-data record

### DataBookkeeping service
- HTTP GET
    - `/datasets` list all datasets
    - `/dataset/*dataset` list details of individual dataset
    - `/files` list all known files
    - `/file/*name` get details of individual file

- HTTP PUT
    - `/dataset/*name` update given dataset
    - `/file/*name` update given file
- HTTP POST
    - `/dataset` create new dataset
    - `/file` create new file

- HTTP DELETE
    - `/dataset/*name` delete given dataset
    - `/file/*name` delete given file

### DataManagement service
- HTTP GET
    - `/storage` get list of S3 storages
    - `/storage:site` get S3 storage info for a given site
    - `/storage:site/:bucket` get S3 bucket info for a given site and bucket
    - `/storage:site/:bucket/:object` get S3 file info for a given site and bucket
- HTTP PUT
- HTTP POST
    - `/storage:site/:bucket` create new bucket on S3 storage at given site
    - `/storage:site/:bucket/:object` create new object

- HTTP DELETE
    - `/storage:site/:bucket` delete bucket on S3 storage at given site
    - `/storage:site/:bucket/:object` delete object
