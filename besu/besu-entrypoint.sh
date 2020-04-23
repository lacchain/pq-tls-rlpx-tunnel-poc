#!/bin/sh

if [ -f /static-nodes.m4 ]
then
    mkdir -p /opt/besu/
    m4 /static-nodes.m4 > /opt/besu/static-nodes.json
else
    echo 'No static nodes defined'
fi

if [ -f /iptables.rules.sh ]
then
    /iptables.rules.sh
else
    echo 'No custom routes defined'
fi

p2pip=`awk 'END{print $1}' /etc/hosts`

/opt/besu/bin/besu $@ --p2p-host=$p2pip
