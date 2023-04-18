# Lacchain Liboqs installation guide:

- Enter as root

```shell
sudo -i
```

- Update

```shell
apt-get update && apt-get install --no-install-recommends -yV \
    dpkg-dev \
    wget \
    ca-certificates
```

- Install liboqs related packages

```shell
mkdir /debs/
wget --directory-prefix=/debs/ https://github.com/lacchain/liboqs-debian/releases/download/0.4.0/liboqs_0.4.0_amd64.deb
wget --directory-prefix=/debs/ https://github.com/lacchain/oqs-openssl-debian/releases/download/OQS-OpenSSL_1_1_1-stable-snapshot-2020-07/libssl1.1_1.1.1g-1+oqs-2020-07_amd64.deb
wget --directory-prefix=/debs/ https://github.com/lacchain/oqs-openssl-debian/releases/download/OQS-OpenSSL_1_1_1-stable-snapshot-2020-07/openssl_1.1.1g-1+oqs-2020-07_amd64.deb
wget --directory-prefix=/debs/ https://github.com/lacchain/liboqs-debian/releases/download/0.4.0/SHA256SUMS
wget https://github.com/lacchain/oqs-openssl-debian/releases/download/OQS-OpenSSL_1_1_1-stable-snapshot-2020-07/SHA256SUMS -O ->> /debs/SHA256SUMS

cd /debs/ && sha256sum --check --ignore-missing --status SHA256SUMS && dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
echo "deb [trusted=yes] file:/debs ./" >> /etc/apt/sources.list

apt update && apt install -y --allow-downgrades \
    libssl1.1=1.1.1g-1+oqs-2020-07 \
    stunnel

rm -rf /var/lib/apt/lists/*
```
