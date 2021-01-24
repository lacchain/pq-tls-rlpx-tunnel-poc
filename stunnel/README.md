# Additional dependencies
You can provide additional Debian dependencies putting them into the `debs/` directory. For example, you can put the **libssl** and **liboqs** from https://github.com/lacchain/liboqs-debian and https://github.com/lacchain/oqs-openssl-debian to enable quantum capabilities

# Certificates
For this POC you must provide your own certificates and a self signed Root Certified Authority. Bellow you can find a set of commands to create those.

## Root CA
### Create Root Key
#### RSA
```shell
$ openssl genrsa -out rootCA.key 4096
```
#### Falcon-512 (Post quantum resistant)
```shell
$ openssl genpkey -algorithm falcon512 -out rootCA.key
```

### Create and self sign the Root Certificate
```shell
$ openssl req -x509 -new -nodes -key rootCA.key -subj "/C=US/ST=CA/O=IADB/CN=godmode" -sha512 -days 1024 -out rootCA.crt
```

## Server certificate
### Create server certificate key
#### RSA
```shell
$ openssl genrsa -out server.key 2048
```
#### Falcon-512
```shell
$ openssl genpkey -algorithm falcon512 -out server.key
```

### Create Certificate Signing Request for server
```shell
$ openssl req -new -sha512 -key server.key -subj "/C=US/ST=CA/O=IADB/CN=server" -out server.csr
```

### Generate the certificate using the CSR and key along with the CA Root key
```shell
$ openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha512
```

## Client certificate
Repeat _server_ certificate section for generating `client.key`, `client.csr` and `client.crt`
