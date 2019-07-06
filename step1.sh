#!/bin/bash

# install Open vSwitch
install/ovs-install.sh

# install Docker-engine
install/docker-install.sh

# manual setup

echo
echo "Now, you need to modify /etc/network/interfaces as follows"
echo
echo "   auto [Interface for the control plane]"
echo "   iface [Interface] inet static"
echo "       address [IP address used for connecting to the control plane]"
echo "       netmask 255.255.255.0"
echo "       network [Network ID]"
echo "       broadcast [Broadcast IP]"
echo
echo "   auto [Interface for the data plane]"
echo "   iface [Interface] inet manual"
echo
echo "Then, please reboot the machine"
echo
