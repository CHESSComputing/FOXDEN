# Usage of curl tool

To use this tool user must obtain valid kerberos ticket
```
# get kerberos ticket
kinit <user>@CLASSE.CORNELL.EDU

# obtain CHESS Data Management Token
./client auth token /tmp/krb5cc_502

# your token will be as following
eyJh...

# set your CHESS_TOKEN environment
export CHESS_TOKEN=eyJh...
```

Now we can search for some data:
```
# set valid token
token=eyJh...

# run curl command
curl -X POST
    -H "Authorization: bearer $token" \
    -H "Content-type: application/json" \ 
    -d '{"client":"frontend","service_query":{"query":"{}","spec":null,"sql":"","idx":0,"limit":2}}' \
    http://localhost:8300/search
```
