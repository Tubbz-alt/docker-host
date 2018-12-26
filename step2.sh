#!/bin/bash

# create a docker image for hosts

cd image
./docker-img.sh

# copy scripts to HOME

cd ..
cp setup/*.sh ~
