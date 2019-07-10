# Docker-Host
Docker-based host environment with a single OVS switch

# Instruction
1. Run step1.sh to install Docker and Open vSwitch

	./step1.sh

2. Modify /etc/network/interface to configure interfaces for the control and data planes

3. Run step2.sh to create a host image and copy scripts to HOME

	./step2.sh

4. Modify docker-setup.sh for your environment

	vi ~/docker-setup.sh

5. Run docker-setup.sh

	./docker-setup.sh

# Requirement
Optimized for Ubuntu 14.04 and Ubuntu 16.04
