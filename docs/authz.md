# FOXDEN Authentication and Authorization service

FOXDEN [Auth/Authz](https://github.com/CHESSComputing/authz)
is CHESS Authentication/authorization service

### Example
```
# obtain kerberos ticket and put it into JSON

cat record.json
{
    "user": <your-user-name>,
    "ticket": <your kerberos ticket>,
    "scope": <read|write>
}

# create JSON payload
curl -X POST -H "Content-type: application/json" \
    -d./record.json http://localhost:8380/oath/authorize
```
