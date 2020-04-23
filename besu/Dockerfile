FROM hyperledger/besu:1.4.3

RUN apt-get update && apt-get install -y \
    m4 iptables \
 && rm -rf /var/lib/apt/lists/*

COPY besu-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
