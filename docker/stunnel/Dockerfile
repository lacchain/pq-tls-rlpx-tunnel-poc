FROM debian:testing-slim as base

RUN apt-get update && apt-get install --no-install-recommends -yV \
    dpkg-dev \
    wget \
    ca-certificates

RUN mkdir /debs/
RUN wget --directory-prefix=/debs/ https://github.com/lacchain/liboqs-debian/releases/download/0.4.0/liboqs_0.4.0_amd64.deb
RUN wget --directory-prefix=/debs/ https://github.com/lacchain/oqs-openssl-debian/releases/download/OQS-OpenSSL_1_1_1-stable-snapshot-2020-07/libssl1.1_1.1.1g-1+oqs-2020-07_amd64.deb
RUN wget --directory-prefix=/debs/ https://github.com/lacchain/oqs-openssl-debian/releases/download/OQS-OpenSSL_1_1_1-stable-snapshot-2020-07/openssl_1.1.1g-1+oqs-2020-07_amd64.deb
RUN wget --directory-prefix=/debs/ https://github.com/lacchain/liboqs-debian/releases/download/0.4.0/SHA256SUMS
RUN wget https://github.com/lacchain/oqs-openssl-debian/releases/download/OQS-OpenSSL_1_1_1-stable-snapshot-2020-07/SHA256SUMS -O ->> /debs/SHA256SUMS

RUN cd /debs/ && sha256sum --check --ignore-missing --status SHA256SUMS && dpkg-scanpackages . /dev/null | gzip -9c > Packages.gz
RUN echo "deb [trusted=yes] file:/debs ./" >> /etc/apt/sources.list

FROM base as runner

RUN apt update && apt install -y --allow-downgrades \
    libssl1.1=1.1.1g-1+oqs-2020-07 \
    stunnel
RUN rm -rf /var/lib/apt/lists/*

COPY stunnel-entrypoint.sh /entrypoint.sh
COPY rootCA.crt /rootCA.crt

ENTRYPOINT ["./entrypoint.sh"]

