FROM hyperledger/besu:20.10.3

USER root
RUN apt-get update && apt-get install -y \
    m4 iptables \
 && rm -rf /var/lib/apt/lists/*

COPY besu-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
