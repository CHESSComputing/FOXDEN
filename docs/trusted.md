# FOXDEN Trusted Users

A trusted foxden user does not need a kerberos ticket in order to obatin a FOXDEN token.
This is useful because it enables data collection processes to automatically submit FOXDEN records without needing to keep renewing a ticket before making requests.
A trusted foxden "user" actually consists of a triplet of parameters: the user, IP address, _and_ MAC address of a request must be an exact match for an item in the `TrustedUsers` section of the FOXDEN configuration.

To use the `foxden` CLI as a trusted user, follow these steps:
1. Determine the triplet of values (user, IP, MAC) you want to be a trusted user.
   1. Run `hostinfo` or `ifconfig`, pick an interface to use (how to pick an interface?)
3. Ask a foxden administrator to add the triplet of values as a trusted user
   and provide you with the minimal FOXDEN configuration .yaml file to use with the `foxden` CLI.
   The minimal FOXDEN configuration .yaml file should look something like this template:
   ```yaml
   Services:
     FrontendUrl:
     DiscoveryUrl:
     DataManagementUrl:
     DataBookkeepingUrl:
     MetaDataUrl:
     AuthzUrl:
     SpecScansUrl:
     MLHubURL:
     PublicationUrl:
     CHAPBookUrl:
   Kerberos:
     Realm: 
     Krb5Conf: 
   Authz:
     ClientId: 
   Encryption:
     Cipher: 
     Secret: 
   ```
3. Save this .yaml file on the trusted machine.
   Make sure the file belongs to the new trusted user and has `400` (`r--------`, owner read only) permissions.
   NB: if you are on the CLASSE system and the new trusted user is a station user on the station computer,
   _do not_ save the configuration file to the user's home directory
   (the file permissions will automatically be changed to `-rw-rw-r--` nightly).
   Instead, save the file to `~/.private/`. 
4. Before using the `foxden` CLI, run `export FOXDEN_TRUSTED_CLIENT=1`.
   Or edit and add the following section to your login script:
   ```bash
   FOXDEN_TRUSTED_INTERFACE="your trusted interface name here" # Edit this line
   FOXDEN_TRUSTED_IP="your trusted ip addr here" # Edit this line
   FOXDEN_TRUSTED_MAC="your trusted mac here" # Edit this line
   
   current_ip=$(ip -4 addr show "$FOXDEN_TRUSTED_INTERFACE" | awk '/inet / {print $2}' | cut -d'/' -f1)
   current_mac=$(ip link show "$FOXDEN_TRUSTED_INTERFACE" | awk '/ether/ {print $2}')
   if [[ "$current_ip" == "$FOXDEN_TRUSTED_IP" && "$current_mac" == "$FOXDEN_TRUSTED_MAC" ]]; then
       export FOXDEN_TRUSTED_CLIENT=1
   fi
   ```
5. When using the `foxden` CLI, make sure to use your new minimal foxden configuration .yaml file with the `--config` option.
   For example: `foxden --config ~/.private/.foxden.yaml meta ls`.
