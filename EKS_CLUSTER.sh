#!/bin/bash
aws configure

# Associate IAM OIDC Provider to accept the IAM credential in EKS cluster:
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster EKS-1 \
    --approve

# Create EKS Cluster	
eksctl create cluster --name=EKS-1 \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup


# nodegroups
eksctl create nodegroup --cluster=EKS-1 \
                       --region=us-east-1 \
                       --name=node2 \
                       --node-type=t2.medium \
                       --nodes=3 \
                       --nodes-min=2 \
                       --nodes-max=4 \
                       --node-volume-size=20 \
                       --ssh-access \
                       --ssh-public-key=DevOps \
                       --managed \
                       --asg-access \
                       --external-dns-access \
                       --full-ecr-access \
                       --appmesh-access \
                       --alb-ingress-access

