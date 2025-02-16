# FOXDEN current system
FOXDEN infrastructure is based on loosely couple services, see
![Implemenation](Implementation.png)

A user communicate through a secure channel with all of them
either view web UI or CLI interfaces. Initially, each user
is authenticated and obtain authorization token from
[Authz](authz.md) service. Each token carry user name and scope
associated with user which allow (s)he to communicate with
individual FOXDEN services. The coupling between FOXDEN services
is done via [Dataset IDentifier (did)](did.md) which is presented
in each individual FOXDEN service. For instance, once user
look-up desired meta-data it has did in it which can be used
to look-up its provenance information and even publish desired
dataset in Publication service.

Currently the following services are implemented:
- [Frontend service: web interface](web.md)
- [Command line (CLI) tool](cli.md)
- [Authentication and authorization service](authz.md)
- [Data Discovery service](discovery.md)
- [MetaData service](metadata.md)
- [Provenance service](provenance.md)
- [Provenance service](provenance.md)
- [Data Management service](datamgt.md)
- [Publication service](publication.md)
- [SpecScan service](specscan.md)
- [MLHub](mlhub.md)
- [CHAP Notebook](notebook.md)

Please see the following diagram how these services are
integrated with each other:
![Services](images/foxden-services.png)

### CHESS integration
The FOXDEN services are deployed to CHESS and cover the
following workflow
![Architecture](images/foxden-prototype.png)
