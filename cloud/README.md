# RLPX Tunnel configuration - cloud environments

## Requirements

- Provide 2 virtual machines(nodes), on each machine install an ethereum client, for example Hyperledger Besu
- Configure those nodes in such a way that both can communicate in a custom ethereum network.

## Configure tunnels

1. install [liboqs related packages](config/LIBOQS.md) on each virtual machine.
2. configure [stunnel service file](config/STUNNEL.md) on each node.
3. Configure tls certificates: Create two sets of server certificates by following these [instructions](config/README.md). To simplify the configuration just use the same rootCA to sign each participant certificate.
4. For each set of 'certificate.key'/'certificate.crt', move those to each virtual machine. One set for each virtual machine. Once moved to each virtual machine you have to locate these files inside the folder "node1"/"node2" respectively. Remember that in step 3 you created these folders and moved them to the respective virtual machines.
5. You are almost ready. Now it is time to start the tunnels and direct the traffic to stunnel services. Enter to the virtual machine 1 and enter into the folder "node1" (that you previously moved to that virtual machine). Now from there make sure all sh files are executable. **Note**: The same thing applies for node2.

## Start tunnels on each machine

Located on node1 or node2 in virtual machines 1 or 2 respectively execute the following command on each machine:

```shell
./start-tunnels.sh && systemctl stop pantheon && sleep 4s && systemctl restart pantheon
```

In this case the command will start the tunnel, modify the firewall configuration and finally will restart the ethereum client to make the changes effective. In this case the client was configured and customized with the [ansible lacchain configuration](https://lacnet.lacchain.net/using-ansible/)

## Stop tunnels

Stopping the tunnel is as simple as:

```shell
./stop-tunnels.sh && systemctl restart pantheon
```
