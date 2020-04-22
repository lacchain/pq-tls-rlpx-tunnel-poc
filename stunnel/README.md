# Create Root CA
## Create Root Key
```shell
$ openssl genrsa -out rootCA.key 4096
```

## Create and self sign the Root Certificate
```shell
$ openssl req -x509 -new -nodes -key rootCA.key -subj "/C=US/ST=CA/O=IADB/CN=godmode" -sha256 -days 1024 -out rootCA.crt
```

# Create a certificate
## Create the certificate key
```shell
$ openssl genrsa -out server.key 2048
```

## Create the Certificate Signing Request
```shell
$ openssl req -new -sha256 -key server.key -subj "/C=US/ST=CA/O=IADB/CN=server" -out server.csr
```

## Generate the certificate using the CSR and key along with the CA Root key
```shell
$ openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt -days 500 -sha256
```
