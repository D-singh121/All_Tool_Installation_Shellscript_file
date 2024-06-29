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

# Download docker-scount release from github repo:
curl -LO https://github.com/docker/scout-cli/releases/download/v1.10.0/docker-scout_1.10.0_darwin_amd64.tar.gz

# Create a subdirectory under $HOME/.docker called scout
mkdir -p $HOME/.docker/scout

# Extract the archive and move the docker-scout binary to the $HOME/.docker/scout directory.
tar -xzf docker-scout_1.10.0_darwin_amd64.tar.gz
mv docker-scout $HOME/.docker/scout/

# Make the binary executable:
chmod +x $HOME/.docker/scout/docker-scout

# # Add the scout subdirectory to your .docker/config.json as a plugin directory:
# # Open your Docker configuration file (config.json). If it doesn't exist, create it in $HOME/.docker/ directory.
# vim $HOME/.docker/config.json

# # paste this in config.json file
# {
#   "cliPluginExtraDirs": [
#     "$HOME/.docker/scout"
#   ]
# }

# this will create the file and append the content over there:
echo '{
  "cliPluginExtraDirs": [
    "$HOME/.docker/scout"
  ]
}' > $HOME/.docker/config.json


# verify the installation 
docker scout --help



