#!/bin/bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version

# To create the EKS cluster with AWS we need eksctl to communicate with cluster.

# # Commands:
#   eksctl anywhere                        EKS anywhere
#   eksctl associate                       Associate resources with a cluster
#   eksctl completion                      Generates shell completion scripts for bash, zsh or fish
#   eksctl create                          Create resource(s)
#   eksctl delete                          Delete resource(s)
#   eksctl deregister                      Deregister a non-EKS cluster
#   eksctl disassociate                    Disassociate resources from a cluster
#   eksctl drain                           Drain resource(s)
#   eksctl enable                          Enable features in a cluster
#   eksctl get                             Get resource(s)
#   eksctl help                            Help about any command
#   eksctl info                            Output the version of eksctl, kubectl and OS info
#   eksctl register                        Register a non-EKS cluster
#   eksctl scale                           Scale resources(s)
#   eksctl set                             Set values
#   eksctl unset                           Unset values
#   eksctl update                          Update resource(s)
#   eksctl upgrade                         Upgrade resource(s)
#   eksctl utils                           Various utils
#   eksctl version                         Output the version of eksctl
