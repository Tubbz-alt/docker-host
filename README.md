# Docker-Host
Docker-based host environment with a single OVS switch

# Instruction
1. Run step1.sh to install Docker and Open vSwitch

	./step1.sh  
	(After this step, you need to log out and log back in)

2. Modify /etc/network/interface to set up the interfaces for the control and data plane

3. Run step2.sh to create a host image and copy setup files to HOME

	./step2.sh

4. Modify docker-setup.sh for your environment

	vi ~/docker-setup.sh  
	./docker-setup.sh

# Requirement
Optimized for Ubuntu 14.04
