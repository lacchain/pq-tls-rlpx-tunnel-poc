#!/bin/sh

echo "\n*************** SERVER TUNNEL CONFIGURATION *****************"

cd /etc/stunnel

cat > stunnel.conf <<_EOF_
debug = 7
foreground = yes
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
ciphers=AESGCM
[server]
client = no
accept = 4912
connect = 127.0.0.1:P2P_PORT
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
