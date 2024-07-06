#!/bin/bash

# To install the splunk download the below package.
# splunk-9.1.2-b6b9c8185839-linux-2.6-amd64.deb

wget -O splunk-9.1.2-b6b9c8185839-linux-2.6-amd64.deb "https://download.splunk.com/products/splunk/releases/9.1.2/linux/splunk-9.1.2-b6b9c8185839-linux-2.6-amd64.deb"

# depackage the installation .deb file 
sudo dpkg -i splunk-9.1.1-64e843ea36b1-linux-2.6-amd64.deb

# Splunk Enterprise is configured to start automatically when your Ubuntu system boots.
sudo /opt/splunk/bin/splunk enable boot-start
sudo ufw allow openSSH
sudo ufw allow 8000

sudo ufw status
sudo ufw enable

sudo /opt/splunk/bin/splunk start

splunk --version
