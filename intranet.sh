#!/bin/bash

#docker network create --help
#Options:
#      --attachable           Enable manual container attachment
#      --aux-address map      Auxiliary IPv4 or IPv6 addresses used by Network driver (default map[])
#      --config-from string   The network from which copying the configuration
#      --config-only          Create a configuration only network
#  -d, --driver string        Driver to manage the Network (default "bridge")
#      --gateway strings      IPv4 or IPv6 Gateway for the master subnet
#      --ingress              Create swarm routing-mesh network
#      --internal             Restrict external access to the network
#      --ip-range strings     Allocate container ip from a sub-range
#      --ipam-driver string   IP Address Management Driver (default "default")
#      --ipam-opt map         Set IPAM driver specific options (default map[])
#      --ipv6                 Enable IPv6 networking
#      --label list           Set metadata on a network
#  -o, --opt map              Set driver specific options (default map[])
#      --scope string         Control the network's scope
#      --subnet strings       Subnet in CIDR format that represents a network segment

docker network create \
--attachable \
--internal \
--driver bridge \
--subnet 192.168.9.0/24 \
--opt [com.docker.network.bridge.name=intranet] \
--label com.docker.compose.network="intranet" \
--label com.docker.compose.project="intranet" \
intranet
