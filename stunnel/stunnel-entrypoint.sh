#!/bin/sh

cd /etc/stunnel

cat > stunnel.conf <<_EOF_
debug = 7
foreground = yes
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1
[${SERVICE}]
client = ${CLIENT:-no}
accept = ${ACCEPT}
connect = ${CONNECT}
CAfile = /rootCA.crt
cert = /etc/stunnel/service.crt
key = /etc/stunnel/service.key
verify = 2
_EOF_

if ! [ -f service.crt ]
then
    echo ERROR: service certificate  not found 1>&2
    exit 1
fi

exec stunnel "$@"
