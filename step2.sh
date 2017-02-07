#!/bin/bash

# create a docker image for hosts

cd image
./docker-img.sh
cd ..

# copy a setup file to HOME

cp setup/docker-setup.sh ~
cp setup/cmd.sh ~
cp setup/ping.sh ~

# manual setup

echo "Some jobs that you need to do by yourself"
echo
echo "1. Modify ~/docker-setup.sh"
echo "2. Modify /etc/network/interfaces"
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
echo "   ..."
