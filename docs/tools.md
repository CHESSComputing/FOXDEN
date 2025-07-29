# FOXDEN Tools
Users may user CHESS Data Management system in many ways
- web UI, please visit [home](/) page
- [curl](https://curl.se/) client: [curl usage](/docs/curl.md)
- Command line tool: [client](/docs/client.md)

The Foxden tools are designed to help users to use and easily navigate
FOXDEN infrastructure and services. Below is a brief overview of
each tool:

### `metaupdate`
The update tool modifies existing metadata records in Foxden by adding Globus
links. This is useful for enhancing metadata with additional information or
references.

### `gentoken`
A utility for generating JSON Web Tokens (JWT) using either HMAC (HS256) or RSA
(RS256) signing algorithms. It allows setting standard claims and adding custom
claims, making it versatile for various authentication needs.

### `enc`
A basic encryption and decryption tool that uses AES to process text input. It
outputs encrypted data as a hexadecimal string and can decrypt it back to the
original text.

### `migrate`
This tool facilitates the transfer of metadata records from one Foxden instance
to another. It constructs proper DIDs (Dataset Identifiers) during the
migration process.

### `migratescans`
This tool facilitates the transfer of scans metadata records from one Foxden instance 
to another.

### `dset`
A prototype for constructing and decoding DIDs (Dataset Identifiers) from JSON
data. It extracts specified attributes to form a DID and can reverse the
process to retrieve the original JSON structure.

### `foxden CLI`
A comprehensive command-line interface for interacting with Foxden services. It
provides commands for managing metadata, accessing provenance, working with S3
storage, and more. The CLI helps users perform various operations on Foxden
resources efficiently.

### `hostinfo`
This tool retrieves and displays the MAC addresses and IP addresses associated
with the local machine. It's useful for network diagnostics and identifying
device connectivity.

### `validator`
A schema validation tool that checks if a JSON schema file adheres to
predefined types and structures. It ensures that the schema is correctly
formatted and that the data types and values align with expected formats.

### `transform`
This tool transforms JSON data by converting camelCase keys to snake_case. It
can handle both schema metadata records and regular JSON records, making it
versatile for data formatting and transformation tasks.

----

These tools collectively enhance the functionality of the Foxden infrastructure by
providing utilities for data manipulation, security, network diagnostics,
schema validation, data transofrmation, and integration. Each tool
is designed to be simple and efficient, focusing on specific tasks within the
Foxden ecosystem.

