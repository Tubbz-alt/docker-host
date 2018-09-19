#!/bin/bash

DOCKER_HOME=~/docker-host/setup

# clean up all old containers 

$DOCKER_HOME/docker-clean.sh

# create new containers

NUM_OF_DOCKERS=31

$DOCKER_HOME/script/1_run_docker.sh $NUM_OF_DOCKERS

# create a new Open vSwitch bridge

# Controller IP and port
CONTROLLERS="tcp:192.168.0.11:6633,tcp:192.168.0.12:6633,tcp:192.168.0.13:6633"

# OpenFlow10 / OpenFlow13
PROTOCOL=OpenFlow10

# Nothing / Target NICs
NIC1=eth0
NIC2=eth1
NIC3=eth2
NIC4=eth3

$DOCKER_HOME/script/2_create_ovs.sh $CONTROLLERS $PROTOCOL $NIC1 $NIC2 $NIC3 $NIC4

# link all containers to the bridge

# NETWORK(X.X.X).DOCKER($START_IP ~ $END_IP)
NETWORK=172.16.0
START_IP=2
END_IP=32
CIDR=24
GATEWAY=172.16.0.1

$DOCKER_HOME/script/3_connect_docker_to_ovs.sh $NETWORK $START_IP $END_IP $CIDR $GATEWAY
