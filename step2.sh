#!/bin/bash

# create a docker image for hosts

cd image
./docker-img.sh
cd ..

# copy a setup file to HOME

cp setup/docker-setup.sh ~
cp setup/cmd.sh ~
cp setup/ping.sh ~
