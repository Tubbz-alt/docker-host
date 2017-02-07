# docker-host
Docker-based host environment with a single OVS switch

# Introduction
1. Run step1.sh to install Docker and Open vSwitch

	./step1.sh

	After this step, you need to log out and log back in.

2. Run step2.sh to create a host image and copy setup files to HOME

	./step2.sh

3. Modify docker-setup.sh for your environment

	vi ~/docker-setup.sh

4. Modify /etc/network/interface to set up the interfaces for the control and data plane
