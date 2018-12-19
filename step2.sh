#!/bin/bash

# create a docker image for hosts

cd image
./docker-img.sh
cd ..

# copy scripts to HOME

cp setup/*.sh ~
