FROM debian:testing-slim

RUN apt update && apt install -y \
    stunnel \
 && rm -rf /var/lib/apt/lists/*

COPY stunnel-entrypoint.sh /entrypoint.sh
COPY rootCA.crt /rootCA.crt

ENTRYPOINT ["./entrypoint.sh"]

