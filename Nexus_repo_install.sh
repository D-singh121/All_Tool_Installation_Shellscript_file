#!/bin/bash
sudo su
sudo apt update

# Install docker
apt-get update
apt install docker.io -y 
sudo usermod -aG docker $USER   #my case is ubuntu

# Run nexus container in background mode .
docker run -d -p 8081:8081 sonatype/nexus3

# checkout into nexus container to get the password 
docker exec -it container_ID /bin/bash

# go the path where the password is stored.
cd /sonatype-work/nexus3/admin-password

# we will get the password.