#!/bin/bash
sudo apt-get install -y apt-transport-https software-properties-common wget

#Import the GPG key:
sudo mkdir -p /etc/apt/keyrings/
wget -q -O - https://apt.grafana.com/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/grafana.gpg > /dev/null

# To add a repository for stable releases, run the following command:
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list

# Updates the list of available packages
sudo apt-get update

# To install Grafana Enterprise, run the following command:
sudo apt-get install grafana-enterprise -y

# start the grafana service 
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server

# Configure the Grafana server to start at boot using systemd
sudo systemctl enable grafana-server.service
sudo systemctl status grafana-server.service