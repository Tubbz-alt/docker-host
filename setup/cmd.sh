#!/bin/bash

if [ -z $1 ]; then
	echo "cmd.sh [host ID]"
else
	docker exec -i -t host-$1 /bin/bash
fi
