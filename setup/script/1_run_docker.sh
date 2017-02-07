#!/bin/bash

# $1 = NUM_OF_DOCKERS

# create docker containers

for i in $(seq 1 $1)
do
	#docker run -i -t -d --net=none --name host-$i ubuntu:14.04 /bin/bash
	docker run -i -t -d --net=none --name host-$i host:0.1 /bin/bash
done

echo $(ip route get 8.8.8.8 | awk 'NR==1 {print $NF}')": Created "$(docker ps -q | wc -l)" containers"
