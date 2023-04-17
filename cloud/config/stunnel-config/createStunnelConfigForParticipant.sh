#!/bin/bash

function createStunnelConfigFiles() {
    nodeDir=$1
    P2P_PORT=$2
    DESTINATION_IP=$3

    rm -rf $nodeDir
    mkdir -p $nodeDir
    cp ./config/stunnel-config/start-tunnels.sh $nodeDir

    cp ./config/stunnel-config/stop-tunnels-template.sh $nodeDir/stop-tunnels.sh
    sed -i "s/P2P_PORT/$P2P_PORT/g" $nodeDir/stop-tunnels.sh
    sed -i "s/DESTINATION_IP/$DESTINATION_IP/g" $nodeDir/stop-tunnels.sh


    cp ./config/stunnel-config/stunnel-config-client-template.sh $nodeDir/stunnel-config-client.sh
    sed -i "s/P2P_PORT/$P2P_PORT/g" $nodeDir/stunnel-config-client.sh
    sed -i "s/DESTINATION_IP/$DESTINATION_IP/g" $nodeDir/stunnel-config-client.sh

    cp ./config/stunnel-config/stunnel-config-server-template.sh $nodeDir/stunnel-config-server.sh
    sed -i "s/P2P_PORT/$P2P_PORT/g" $nodeDir/stunnel-config-server.sh
}

createStunnelConfigFiles $1 $2 $3