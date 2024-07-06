#!/bin/bash
# Installation of Ansible on ubuntu
lsb_release -a
sudo apt update -y
sudo apt upgrade -y

# Add Ansible PPA (Personal Package Archive)
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt update -y
sudo apt install ansible -y
ansible --version



# setup host machine located at this location '/etc/ansible/hosts';
# vim /etc/ansible/hosts
# # Ex 2: A collection of hosts belonging to the 'webservers' group:
# [servers]
# server_1 ansible_host=54.211.7.215
# server_2 ansible_host=3.83.114.116
# server_3 ansible_host=54.174.65.36
# server_4 ansible_host=44.203.139.240

# # we can categorise server based on there works
# # [dev_server]
# # server_1 ansible_host=54.211.7.215
# # server_2 ansible_host=3.83.114.116

# # [prod_server]
# # server_3 ansible_host=54.211.7.215
# # server_4 ansible_host=3.83.114.116


# # Now copy the .pem file from your local to remote host machine because Ansible conntects to servers by ssh way.
# # scp -i /pem_key_pair_file_path_name  filename_want_to_copy  ec2_user@ec2_public_ip:destination_location_on_remote
#  eg: scp -i "DevOps.pem" DevOps.pem  ubuntu@ec2-34-239-103-88.compute-1.amazonaws.com:/home/ubuntu/keys

# # Now configure the .pem key in remote host machine file like this:
# # For connecting the agent machine server with ansible host machine we need a .pem key file and set this file as variale:
# [servers:vars]
# ansible_python_interpreter=/usr/bin/python3
# ansible_user=ubuntu # perticular user for list of servers
# ansible_ssh_private_key_file=/home/ubuntu/keys/DevOps.pem

# save the file and run this command on host terminal
# ansible <servers_name> -m ping
# eg: ansible servers -m ping 

# # check storage on all agent servers linked with host server
#  ansible servers -a "free -h"
#  ansible servers -a "sudo apt update"    // update all agent servers in servers group at once with single command.
#  ansible all -a "sudo apt update -y "  // update all servers
# ansible prod -a "sudo apt update -y"   // update in prod group servers
# ansible-inventory --list  // List all the servers , groups and thair permission;

# # PLAYBOOK : its YAML kind of file 
# # eg:
# ---
# -
#   name: Dates Playbook
#   hosts: servers
#   become: true
#   tasks:
#     - name: Show date
#       command: date
#     - name: Update package lists
#       apt:
#         update_cache: yes
#     - name: show uptime
#       command: uptime



