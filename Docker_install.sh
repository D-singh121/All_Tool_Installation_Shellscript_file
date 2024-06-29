#!/bin/bash
sudo apt-get update -y 
sudo apt install docker.io -y 
sudo apt install docker-compose  -y  # for run services 
docker --version
docker-compose --version

sudo systemctl start docker
sudo systemctl enable docker 
sudo systemctl status docker 

sudo chmod 666 /var/run/docker.sock
sudo usermod -aG docker $USER   # add host user to docker group 
newgrp docker
