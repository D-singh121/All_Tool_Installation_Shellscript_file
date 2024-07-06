#!/bin/bash

# Create the sonarqube system user
sudo adduser --system sonarqube

# Set the SonarQube version
SONAR_VERSION="9.4.0.54424"

# Check if the SonarQube ZIP file already exists
if [ ! -f "sonarqube-${SONAR_VERSION}.zip" ]; then
    # Download SonarQube
    wget "https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-${SONAR_VERSION}.zip"
else
    echo "SonarQube ZIP file already exists. Skipping download."
fi

# Install unzip
sudo apt update
sudo apt install -y unzip

# Unzip the downloaded file
unzip "sonarqube-${SONAR_VERSION}.zip"

# Set permissions and ownership
chmod -R 755 "sonarqube-${SONAR_VERSION}"
sudo chown -R sonarqube:sonarqube "sonarqube-${SONAR_VERSION}"

# Navigate to the SonarQube binary directory and start SonarQube
cd "sonarqube-${SONAR_VERSION}/bin/linux-x86-64/"
./sonar.sh start

# --------OR from docker image --------------//
# docker run -d --name sonar -p 9000:9000 sonarqube:lts-community