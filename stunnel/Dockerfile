FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    stunnel \
 && rm -rf /var/lib/apt/lists/*

COPY stunnel-entrypoint.sh /entrypoint.sh
COPY rootCA.crt /rootCA.crt

ENTRYPOINT ["./entrypoint.sh"]

