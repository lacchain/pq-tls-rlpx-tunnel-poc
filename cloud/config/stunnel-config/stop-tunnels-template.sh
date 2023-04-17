#!/bin/sh
echo "Deleting tunnel configured firewal rules"
iptables -t nat -D OUTPUT -p tcp --dport P2P_PORT -d DESTINATION_IP -j DNAT --to-destination 127.0.0.1:4911 2>/dev/null || echo "Rule not found, skipping ..." && \
iptables -D INPUT -p tcp ! -d localhost --dport P2P_PORT -j DROP 2>/dev/null  || echo "Rule not found, skipping ..."  && \
echo "Terminating all tunnels" && \
for pid in `ps -aux | grep stunnel | awk '{ print $2  }'`; do kill -9 $pid 2>/dev/null || echo "All tunnels were terminated"; done;
