## Initially no have the permission to view the node group and resources on EKS cluster so, we have to manually give the access from AWS console.

## By dashboard: ' This Iam setup will be prompted on Dashboard once we go into our created cluster like "Create access entry" click on it and it will automaticaly pick the root "arn"  then follow the below process from Type selection';
- Goto --> EKS -->  Created EKS cluster --> 'Access' Tab  --> Create access entry --> Configure IAM access entry --> Choose 'arn:aws:iam::<aws-root-account-Id>:root' as IAM principal ARN --> Type 'Standard' --> Click "Next" button --> Add 'AmazonEKSClusterAdminPolicy' as Policy name --> Access scope 'Cluster' --> Click 'Add policy' button --> click to 'Next' --> Click on 'Next' button --> refresh the page and check on 'Compute' tab

## By AWS cli: ' this will configure the kubectl'
aws eks update-kubeconfig --name <your-eks-cluster-name> --region us-east-1