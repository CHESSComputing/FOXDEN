# FOXDEN Authentication and Authorization service

FOXDEN [Auth/Authz](https://github.com/CHESSComputing/authz)
is Authentication and Authorization service responsible
for handling user credentials. At CHESS we use kerberos
authentication and it is used as primary mechanism to
authenticate users. At the same time Authz service allows
authenticate users via common OIDC providers like Google, Git,
and Facebook.

The authorization of users is linked to LDAP server which
defines users roles within organization. These roles are
transformed to user's `scope` carried within bearer token.

### Example
```
# obtain kerberos ticket and compose user's record

cat record.json
{
    "user": <your-user-name>,
    "ticket": <your kerberos ticket>,
    "scope": <read|write>
}

# authorize used with his/her record credentials
# and receive aiuthorization token (default expiration 1h)
curl -X POST -H "Content-type: application/json" \
    -d./record.json http://localhost:8380/oath/authorize
```
