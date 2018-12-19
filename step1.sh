#!/bin/bash

# install Open vSwitch
install/ovs-install.sh

# install Docker-engine
install/docker-install.sh

# manual setup

echo
echo "Some jobs that you need to do by yourself"
echo
echo "- Modify /etc/network/interfaces"
echo "   auto [Interface for the control plane]"
echo "   iface [Interface] inet static"
echo "       address [IP address used for connecting to the control plane]"
echo "       netmask 255.255.255.0"
echo "       network [Network ID]"
echo "       broadcast [Broadcast IP]"
echo
echo "   auto [Interface for the data plane]"
echo "   iface [Interface] inet manual"
