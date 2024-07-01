#!/bin/bash
# This is the combine script to install Jenkins, docker,sonar and trivy on any single machine.
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


# Jenkins
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

# sonar
docker run -d --name sonar -p 9000:9000 sonarqube:lts-community   # run container
sonar-scanner -v

# aws cli
sudo apt update -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install
aws --version

# trivy
sudo apt-get install wget apt-transport-https gnupg lsb-release
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | sudo apt-key add -
echo deb https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main | sudo tee -a /etc/apt/sources.list.d/trivy.list
sudo apt-get update -y
sudo apt-get install trivy -y
trivy -v

# eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

