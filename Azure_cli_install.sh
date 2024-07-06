#!/bin/bash
# Get packages needed for the installation process
sudo apt-get update
sudo apt-get install ca-certificates curl apt-transport-https lsb-release gnupg

# Download and install the Microsoft signing key:
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg

# Add the Azure CLI software repository:
AZ_DIST=$(lsb_release -cs)
echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ $AZ_DIST main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Update repository information and install the azure-cli package:
sudo apt-get update
sudo apt-get install azure-cli

# check installation
az --version


# # azure-cli login 
# az login

# # give the subcription id or name for resource to be created.
# az account set --subcription <your_subcription_id>

# # list all resource_group
# az group list 

# # pass the env variables using az cli way
# export ARM_CLIENT_ID="your-client-id"
# export ARM_CLIENT_SECRET="your-client-secret"
# export ARM_SUBSCRIPTION-ID="your-subscription-id"
# export ARM_TENANT_ID="your-tenant-id"