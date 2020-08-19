FROM debian:testing-slim

COPY debs/ /debs

RUN apt update && apt install -y \
    stunnel
RUN (ls /debs/*.deb >> /dev/null 2>&1 && apt install -y /debs/*.deb) || echo "No extra dependencies"
RUN rm -rf /var/lib/apt/lists/*

COPY stunnel-entrypoint.sh /entrypoint.sh
COPY rootCA.crt /rootCA.crt

ENTRYPOINT ["./entrypoint.sh"]

