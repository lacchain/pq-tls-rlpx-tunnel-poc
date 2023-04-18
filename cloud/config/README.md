# Certificates

Before starting make sure you have configured the liboqs related libraries, you can follow these [steps](LIBOQS.md) to have the postquantum openssl version.

## Root CA

Let's create a root key compliant with falcon-512, this root key wil be used to sign certificates created by each participant (in our case each virtual machine that hosts the ethereum node)

### Create Root Key

#### Falcon-512 (Post quantum resistant)

```shell
$ openssl genpkey -algorithm falcon512 -out rootCA.key
```

### Create and self sign the Root Certificate

```shell
$ openssl req -x509 -new -nodes -key rootCA.key -subj "/C=US/ST=CA/O=IADB/CN=godmode" -sha512 -days 1024 -out rootCA.crt
```

## Server certificate

Now for each participant (in our case each virtual machine that hosts the ethereum node) lets create a post quantum signed certificate

### Create server certificate key

Each participant creates a server.key (their private key)

#### Falcon-512

```shell
$ openssl genpkey -algorithm falcon512 -out certificate.key
```

### Create Certificate Signing Request for server

Now the participant creates a certificate signing request (CSR)

```shell
$ openssl req -new -sha512 -key certificate.key -subj "/C=US/ST=CA/O=IADB/CN=server" -out certificate.csr
```

### Generate the certificate using the CSR and key along with the CA Root key

Now the root CA signs the CSR by using rootCA key with Falcon512 algorithm

```shell
$ openssl x509 -req -in certificate.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out certificate.crt -days 500 -sha512
```

## Further steps

You can repeat the same server certificate generation process using the same root CA key. So at a later point these participants will use it to securely communicate with each other over the internet.
