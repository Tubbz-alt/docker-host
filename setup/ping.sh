#!/bin/bash

NETWORK=172.16.0
START_IP=1
END_IP=32

CNT=0
for i in $(seq $START_IP $END_IP)
do
	ping -c 1 -t 5 $NETWORK.$i > /dev/null
	if [ $? -eq 0 ]
	then
		echo "$NETWORK.$i: success"
		let CNT=CNT+1
	else
		echo "$NETWORK.$i: fail"
	fi
done

echo "Success: "$CNT
