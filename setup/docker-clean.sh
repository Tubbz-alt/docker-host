#!/bin/bash

# remove all containers
docker rm -f `docker ps -aq` 2> /dev/null
