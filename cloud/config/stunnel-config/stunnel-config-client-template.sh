#!/bin/sh

echo "\n*************** CLIENT TUNNEL CONFIGURATION *****************"
echo "Configuring firewall rules"
iptables -t nat -D OUTPUT -p tcp --dport P2P_PORT -d DESTINATION_IP -j DNAT --to-destination 127.0.0.1:4911 2>/dev/null  || echo "Rule no found ... skipping deletion"  && \
iptables -D INPUT -p tcp ! -d localhost --dport P2P_PORT -j DROP 2>/dev/null  || echo "Rule no found ... skipping deletion"  && \
iptables -t nat -A OUTPUT -p tcp --dport P2P_PORT -d DESTINATION_IP -j DNAT --to-destination 127.0.0.1:4911 && \
iptables -I INPUT -p tcp ! -d localhost --dport P2P_PORT -j DROP
echo "Starting Client Tunnel" && \
cat > stunnel.conf <<_EOF_
debug = 7
foreground = yes
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
ciphers=AESGCM
[client]
client = yes
accept = 0.0.0.0:4911
connect = DESTINATION_IP:4912
CAfile = /etc/stunnel/rootCA.crt
cert = /etc/stunnel/certificate.crt
key = /etc/stunnel/certificate.key
verify = 2
_EOF_

if ! [ -f certificate.crt ]
then
    echo ERROR: service certificate  not found 1>&2
    exit 1
fi

exec stunnel "$@"
