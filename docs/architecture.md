# Architecture
![Architecture](images/Architecture.png)

CHESS Data Management architecture is based on loosely coupled set of MicroServices:
- the frontend service to provide web UI interface to end-users
- the authentication service to provide authentication to end-users
  - upon successfull authentication it issue valid token used across all other
    services
- the data discovery service to keep track of participated sites
- the meta-data service to keep track of meta-data information
- the data-management service to manage on-site data via S3 storage objects
- the data-bookkeeping service to keep provenance information about dataset
  processing
- the authentication and authorization service
- the command line client
All of them are glued together by HTTP protocol and represent whole
[infrustructure](/docs/infrastructure.md).
For further details please refer to [implementation](/docs/implementation.md)
and [apis](/docs/apis.md) details.
