#!/bin/bash

# update the machine 
sudo apt-get update

# It has apt-transport-https and curl installed:
sudo apt-get install apt-transport-https ca-certificates gnupg curl sudo

# Import the Google Cloud public key.
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg

# Add the gcloud CLI distribution URI as a package source.
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

# Update and install the gcloud CLI:
sudo apt-get update && sudo apt-get install google-cloud-cli

# verify installation 
gcloude --version

# # for login on gcloud
# gcloud auth application-default login

# # login credential is stored in below folder for myself .
# /home/dee_singh/.config/gcloud/application_default_credentials.json

# # way to pass env credential on gcp cloud by cli 
# export GOOGLE_APPLICATION_CREDENTIALS="/path/to/your/keyfile.json"   # created from service account.

# # for creating the google_compute_instance with terraform.
# ##----> my service Account
# #----> file name : my-terraform-project-412913-a43d9c23460e.json

# # Set Project Using gcloud config set project Command:
# gcloud config set project YOUR_PROJECT_ID
# ------------- OR by Envirnoment variabel-----------
# # Set Project Using Environment Variable:
# export CLOUDSDK_CORE_PROJECT=YOUR_PROJECT_ID


# # enabel the service apis on APIs & services list of library.
# 1. Service Usage API
# 2. Cloud Resource Manager API

# # After enabling the "Service Usage API" and "Cloud Resource Manager API" ,you can retry setting the quota project using the following command:
# gcloud auth application-default set-quota-project <YOUR-PROJECT-ID>

# # gcloud commands
# gcloud compute images list  
