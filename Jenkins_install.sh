#!/bin/bash
sudo apt update
sudo apt install fontconfig openjdk-17-jre -y
java -version

# install gpg-key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install jenkins -y
jenkins --version

# Enable and Start Jenkins service: 
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

