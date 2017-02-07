#!/bin/bash

DOCKER_HOME=~/docker-host/setup

DOCKER_ID=$1
BRIDGE_NAME=$2
VETH_NAME=$3
DOCKER_IP=$4
CIDR=$5
GATEWAY=$6

if [ $# != 6 ];
then
	echo "sudo docker_to_ovs.sh [container_id] [bridge name] [virtual ethernet name] [container_ip] [CIDR] [gateway]"
else
	mac=$(python $DOCKER_HOME/script/components/create_mac.py $DOCKER_IP)

	# 2. connect apps(container form) to ovs-[bridge]

	pcs_id=$(sudo docker inspect -f '{{.State.Pid}}' $DOCKER_ID)

	# 2-1. create network namespace for app

	sudo ln -s /proc/$pcs_id/ns/net /var/run/netns/$pcs_id

	# 2-2. create peer veth intf for app, ovs-[bridge]

	sudo ip link add $VETH_NAME type veth peer name veth-a

	# 2-3. add veth-a intf to ovs-[bridge] and link up

	sudo ovs-vsctl add-port $BRIDGE_NAME $VETH_NAME
	sudo ip link set $VETH_NAME up

	# 2-4. add veth-a intf to app and link up

	sudo ip link set veth-a netns $pcs_id
	sudo ip netns exec $pcs_id ip link set dev veth-a name eth0
	sudo ip netns exec $pcs_id ip link set eth0 address $mac
	sudo ip netns exec $pcs_id ip link set eth0 up
	sudo ip netns exec $pcs_id ip addr add $DOCKER_IP/$CIDR dev eth0
	sudo ip netns exec $pcs_id ip route add default via $GATEWAY
fi
