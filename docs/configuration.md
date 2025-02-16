# FOXDEN configuration
FOXDEN configuration follows all Go Language strucs definitions
from [config.go](https://github.com/CHESSComputing/golib/blob/main/config/config.go)
file. We use [yaml](https://en.wikipedia.org/wiki/YAML) format
for FOXDEN configuration file. Usually it is stored in
`$HOME/.foxden.yaml` file. This file is structured in different
blocks which corresponds to specific parts of FOXDEN service
congregation. For example, the LDAP configuration block
is defined by `LDAP` data structure in `config.go` as following
```
// LDAP data struct
type LDAP struct {
	URL      string `mapstructure:"url"`      // ldap url
	BaseDN   string `mapstructure:"baseDN`    // ldap baseDN
	Login    string `mapstructure:"login"`    // LDAP login to use
	Password string `mapstructure:"password"` // LDAP password to use
	Expire   int    `mapstructure:"expire"`   // LDAP cache record expire (in seconds)
}
```
and its corresponding configuration block will be represented as
following:
```
# corresponding block in configuration
LDAP:
  URL: "ldaps://ldap.url.com:636"
  baseDN: "DC=dc,DC=org,DC=edu"
  Login: "account@LDAP.URL.COM"
  Password: "some-password"
```

### FOXDEN services configuration
Since FOXDEN configuration defines individual blocks for each
service your final configuration file may depends how many
FOXDEN services are deployed at your premises. Below we show
example of configuration file currently used at CHESS
```
Services:
  FrontendUrl: http://localhost:8344
  DiscoveryUrl: http://localhost:8320
  DataManagementUrl: http://localhost:8340
  DataBookkeepingUrl: http://localhost:8310
  MetaDataUrl: http://localhost:8300
  AuthzUrl: http://localhost:8380
  SpecScansUrl: http://localhost:8390
  MLHubUrl: http://localhost:8350
  PublicationUrl: http://localhost:8355
  CHAPBookUrl: https://localhost:8181
LDAP:
  URL: "ldaps://ldap.url.com:636"
  baseDN: "DC=dc,DC=org,DC=edu"
  Login: "account@LDAP.URL.COM"
  Password: "some-password"
Globus:
  client_id: "client-id"
  client_secret: "secret"
  transfer_url: "https://transfer.api.globus.org/v0.10"
  auth_url: "https://auth.globus.org/v2/oauth2/token"
DOI:
  Provider: Zenodo # default provider
  ProjectName: "FOXDEN datasets" # name of default project
  Zenodo:
    Url: https://zenodo.org/api
    AccessToken: access-token-string
PublicationService:
  WebServer:
    Port: 8355
    Verbose: 1
    LogFile: /path/logs/PublicationService.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
QL:
  ServiceMapFile: /path/configs/service_map_file.json
DID:
  Attributes: "beamline,btr,cycle,sample"
  Separator: "/"
  Divider: "="
# Embed:
#   DocDB: badger
CHESSMetaData:
  LexiconFile: /path/configs/metadata_lexicon.json
  SchemaRenewInterval: 3600
  SchemaFiles:
    - "/path/configs/ID4B.json"
    - "/path/configs/ID3A.json"
    - "/path/configs/ID1A3.json"
    - "/path/configs/test.json"
  SkipKeys: ["user", "date", "description", "schema_name", "schema_file", "schema", "did", "doi", "doi_url", "doi_user", "doi_created_at"]
  WebSections: /path/configs/web_form_sections.json
  OrderedSections: ["User", "Alignment", "DataLocations", "Beam", "Experiment", "Sample"]
  MongoDB:
    DBUri: mongodb://localhost:8230
    DBName: foxden
    DBColl: meta
  WebServer:
    Port: 8300
    Verbose: 1
    LogFile: /path/logs/Metadata.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
Kerberos:
  Realm: CLASSE.CORNELL.EDU
  Krb5Conf:  /etc/krb5.conf
Authz:
  CheckLDAP: true
  DBFile: /path/Authz/dbfile
  ClientId: client_id
  ClientSecret: client_secret
  WebServer:
    Port: 8380
    Verbose: 3
    LogFile: /path/logs/Authz.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
SpecScansService:
  DBFile: /path/SpecScansService/motors.db
  SchemaFile: /path/SpecScansService/static/schema.json
  MongoDB:
    DBUri: mongodb://localhost:8230
    DBName: foxden
    DBColl: specscans
  WebServer:
    Port: 8390
    Verbose: 1
    LogFile: /path/logs/SpecScansService.log
    StaticDir: /path/SpecScansService/static
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
MLHub:
  ML:
    StorageDir: /tmp/mlhub
    MLBackends:
      - name: TFaaS
        type: TensorFlow
        uri: http://localhost:9999
        apis:
          - name: upload
            method: POST
            endpoint: upload
          - name: predict
            method: POST
            endpoint: predict
      - name: MLGauss
        type: ScikitLearn
        uri: http://localhost:9099
        apis:
          - name: upload
            method: POST
            endpoint: upload
          - name: predict
            method: POST
            endpoint: predict
      - name: GoFake
        type: TensorFlow
        uri: http://localhost:8888
        apis:
          - name: upload
            method: POST
            endpoint: upload
          - name: predict
            method: POST
            endpoint: predict
  WebServer:
    Port: 8350
    Verbose: 1
    StaticDir: static
    LogFile: /path/logs/MLHub.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
  MongoDB:
    DBUri: mongodb://localhost:8230
    DBName: foxden
    DBColl: mlhub
DataBookkeeping:
  ApiParametersFile: /path/configs/dbs_parameters.json
  DBFile: /path/DataBookkeeping/dbfile
  LexiconFile: /path/configs/dbs_lexicon.json
  WebServer:
    Port: 8310
    StaticDir: /path/DataBookkeeping/static
    Verbose: 2
    LogFile: /path/logs/DataBookkeeping.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
DataManagement:
  S3:
    Name: minio
    Endpoint: localhost:8330
    AccessKey: "key"
    AccessSecret: "secret"
    UseSSL: false
  WebServer:
    Port: 8340
    Verbose: 1
    LogFile: /path/logs/DataManagement.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
Discovery:
  MongoDB:
    DBUri: mongodb://localhost:8230
    DBName: foxden
    DBColl: meta
  WebServer:
    Port: 8320
    Verbose: 1
    LogFile: /path/logs/DataDiscovery.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
Encryption:
  Cipher: aes
  Secret: bla
Frontend:
  CheckBtrs: true
  CheckAdmins: false
  AllowAllRecords: false
  TestMode: false
  WebServer:
    Port: 8344
    StaticDir: /path/Frontend/static
    Verbose: 1
    LogFile: /path/logs/Frontend.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
      Production: true
  OAuth:
    -
      Provider: github
      ClientID: "client-id"
      ClientSecret: "secret"
    -
      Provider: google
      ClientID: "client-id"
      ClientSecret: "secret"
      RedirectURL: http://localhost:8344/google/callback
    -
      Provider: facebook
      ClientID: "client-id"
      ClientSecret: "secret"
      RedirectURL: http://localhost:8344/facebook/callback
MetaData:
  MongoDB:
    DBUri: mongodb://localhost:8230
    DBName: foxden
    DBColl: meta
  WebServer:
    Port: 8300
    Verbose: 0
    LogFile: /path/logs/MetaData.log
    LogLongFile: true
    GinOptions:
      DisableConsoleColor: true
```


### FOXDEN CLI configuration
The FOXDEN CLI only need to know each FOXDEN services
it should use along with few additional configuration
blocks, like Kerberos and Authz. Here is an
example configuration required to run FOXDEN command line client
(you may save it under `$HOME/.foxden-cli.yaml`) using
locally deployed FOXDEN services (running on localhost):
```
Services:
  FrontendUrl: https://localhost:8344
  DiscoveryUrl: https://localhost:8320
  DataManagementUrl: https://localhost:8340
  DataBookkeepingUrl: https://localhost:8310
  MetaDataUrl: https://localhost:8300
  AuthzUrl: https://localhost:8380
  SpecScansUrl: https://localhost:8390
  MLHubURL: https://localhost:8350
  PublicationUrl: https://localhost:8355
  CHAPBookUrl: http://localhost:8181/
Kerberos:
  Realm: CLASSE.CORNELL.EDU
  Krb5Conf:  /etc/krb5.conf
Authz:
  ClientId: some-client-id
```
