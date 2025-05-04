#!/bin/bash
# sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

# # Install the HashiCorp GPG key.
# wget -O- https://apt.releases.hashicorp.com/gpg | \
# gpg --dearmor | \
# sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

# # Verify the key's fingerprint.
# gpg --no-default-keyring \
# --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
# --fingerprint

# # Add the official HashiCorp repository to your system
# echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
# https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
# sudo tee /etc/apt/sources.list.d/hashicorp.list

# # update packages and install terraform.
# sudo apt update
# sudo apt-get install terraform -y
# terraform -v


##--------------------- Updated installation commands for debian ubuntu os  as per 2025 -----------------------------##
sudo apt-get update -y
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform -v

# ## terraform basic commands;
# # create the " .tf " file then follow below steps.
# # initilize the terraform configuration file.
#  trraform init
# # to see any changes that are required for your infrastructure just like DRY run.
#  terraform plan

# # validate the terraform file.
#  terraform validate
	
# # run the main.tf file or to run the terraform file.  
#  terraform apply
# # destroy pertial resource and create on next apply command.
#  terraform taint <resource_type.reference_name>		
# # now destroy the all resource created by terraform file
#  terraform destroy
	
      	
# ## we can pass the variable in 3 ways on terraform.
# # 1. BY cli ways
#   terraform plan -var="variable_name=variable_value"    

# # 2. By using the Environment variable.	(use "export for LINUX" and  "set for WINDOWS ")
#   export TF_VAR_Credentials=credentials_value
  
# # 3. we can directly apply this to terraform command
#   TF_VAR_Credentials=credentials_value terraform apply

# # Terraform State commands

# ● terraform state list : List resources within terraform state.
# ● terraform-state mv : Move items within terraform state. This will be used to resource
# renaming without destroy, apply command
# ● terraform state pull : Manually download and output the state from the state file.
# ● terraform state push : Manually upload a local state file to the remote state
# ● terraform state rm : Remove items from the state. Items removed from the state are not physically destroyed. This item no longer managed by 	Terraform.
# ● terraform state show: Show attributes of a single resource in the state.

