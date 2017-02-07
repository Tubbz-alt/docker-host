#!/bin/bash

# $1 = NETWORK
# $2 = START_IP
# $3 = END_IP
# $4 = CIDR
# $5 = GATEWAY

DOCKER_HOME=~/docker-host/setup

sudo rm -rf /var/run/netns 2> /dev/null
sudo mkdir -p /var/run/netns

IDX=1
for i in $(seq $2 $3)
do
	$DOCKER_HOME/script/components/docker_to_ovs.sh host-$IDX br0 veth-$IDX $1.$i $4 $5
	IDX=`expr $IDX + 1`
done

echo $(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')": Connected containers to Open vSwitch"
