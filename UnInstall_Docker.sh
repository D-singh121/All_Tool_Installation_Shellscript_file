#!/bin/bash

# Stop Docker service
echo "Stopping Docker service..."
sudo systemctl stop docker

# Remove Docker packages
echo "Removing Docker packages..."
sudo apt-get purge docker.io docker-compose -y

# Remove Docker dependencies
echo "Removing Docker dependencies..."
sudo apt-get autoremove -y

# Remove Docker group
echo "Removing Docker group..."
sudo groupdel docker

# Remove Docker user
echo "Removing Docker user..."
sudo userdel docker

# Remove Docker configuration files
echo "Removing Docker configuration files..."
sudo rm -rf /etc/docker
sudo rm -rf /var/lib/docker
sudo rm -rf /var/run/docker.sock

# Remove Docker systemd service files
echo "Removing Docker systemd service files..."
sudo rm -rf /lib/systemd/system/docker.service
sudo rm -rf /lib/systemd/system/docker.socket

# Reload systemd daemon
echo "Reloading systemd daemon..."
sudo systemctl daemon-reload

echo "Docker uninstalled successfully!"