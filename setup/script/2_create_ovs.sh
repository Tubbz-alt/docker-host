#!/bin/sh

# $1 = CONTROLLERS
# $2 = PROTOCOL
# $3 = NIC1
# $4 = NIC2
# $5 = NIC3
# $6 = NIC4

# delete bridge

sudo ovs-vsctl del-br br0 2> /dev/null

# create bridge

sudo ovs-vsctl add-br br0

# set controller

CONTROLLERS=$(echo $1 | sed 's/,/ /g')
sudo ovs-vsctl set-controller br0 $CONTROLLERS

# set operation mode

sudo ovs-vsctl set-fail-mode br0 secure

# set OpenFlow version

sudo ovs-vsctl -- set bridge br0 protocols=$2
#sudo ovs-vsctl -- set bridge br0 other-config:datapath-id=0000000000000001

# add NICs

if [ ! -z $3 ]; then
sudo ovs-vsctl add-port br0 $3
fi
if [ ! -z $4 ]; then
sudo ovs-vsctl add-port br0 $4
fi
if [ ! -z $5 ]; then
sudo ovs-vsctl add-port br0 $5
fi
if [ ! -z $6 ]; then
sudo ovs-vsctl add-port br0 $6
fi

echo $(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')": Created Open vSwitch"
