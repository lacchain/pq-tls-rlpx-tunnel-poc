# Configure Stunnel files

- Configure stunnel:

```sh
BESU_NODE_1_IP=10.142.15.194 # update this with the correct ip
BESU_NODE_2_IP=10.168.0.8 # update this with the correct ip
P2P_PORT=60606 # for simplicity use this port for p2p communication between nodes, let's assume 60606 port number is the P2P configured port number
```

- Create stunnel files for node 1: Situated on the $root_directory/cloud of this repo execute:

  - for node 1:

  ```sh
      DESTINATION_IP=$BESU_NODE_2_IP # the IP of the other node to communicate with
      ./config/stunnel-config/createStunnelConfigForParticipant.sh node1 $P2P_PORT $DESTINATION_IP
  ```

  - for node 2:

  ```sh
      DESTINATION_IP=$BESU_NODE_1_IP # the IP of the other node to communicate with
      ./config/stunnel-config/createStunnelConfigForParticipant.sh node2 $P2P_PORT $DESTINATION_IP
  ```

- The previous step will generate two folders (node1 and node2) containing the necessary configuration for both nodes in order to allow them to communicate through stunnel. Now you have to copy node1 and node2 folders to the respective virtual machines.
