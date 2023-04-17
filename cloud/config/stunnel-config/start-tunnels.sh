#!/bin/sh

./stop-tunnels.sh
cd /etc/stunnel
(./stunnel-config-client.sh > /dev/null 2>&1 &) && sleep 2s && (./stunnel-config-server.sh > /dev/null 2>&1 &) && \
echo "all tunnels have been started, now connection is quantum resistant"
