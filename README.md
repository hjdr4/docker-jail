# docker-jail

A simple user isolation system using Docker.

Maintaining chroots can be painfull.
This projects provides wrapper scripts to get users log into a Docker container instead of the host, so the only work you have to do is maintaining a Dockerfile.

Usefull for bastion like systems.

# Usage
- Download this project
- Edit the Dockerfile with your need for jails
- Build your jail image with tag `docker-jail`
- Copy `shell/docker-jail` to `/bin/`.This is the wrapper script on login
- Create some users and give them `/bin/docker-jail` as shell
- Now every su, ssh, whatever login will make users jailed into a container with the only commands you allow

# Notes
- Containers' users are the one on the host, created on the fly
- Containers are started with option `--net host` by default
- The 2 previous points allow for iptables rules matching users so you keep things simple
- Containers are ephemeral by default
