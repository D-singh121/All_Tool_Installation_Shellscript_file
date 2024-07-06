#!/bin/bash
aws configure

# Create EKS Cluster	
eksctl create cluster --name=EKS-1 \
                      --region=us-east-1 \
                      --zones=us-east-1a,us-east-1b \
                      --without-nodegroup

# Associate IAM OIDC Provider to accept the IAM credential in EKS cluster:
eksctl utils associate-iam-oidc-provider \
    --region us-east-1 \
    --cluster EKS-1 \
    --approve

# create nodegroups
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


## Create a namespace for app deployment isolation.
kubectl create namespace webapps

## Create aservice account for k8s deployment "svc-account.yml"
apiVersion: v1
kind: ServiceAccount
metadata:
  name: jenkins
  namespace: webapps


## Create a role for service account "role.yml"
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: app-role
  namespace: webapps
rules:
  - apiGroups:
      - ''
      - apps
      - autoscaling
      - batch
      - extensions
      - policy
      - rbac.authorization.k8s.io
    resources:
      - pods
      - componentstatuses
      - configmaps
      - daemonsets
      - deployments
      - events
      - endpoints
      - horizontalpodautoscalers
      - ingress
      - jobs
      - limitranges
      - namespaces
      - nodes
      - pods
      - persistentvolumes
      - persistentvolumeclaims
      - resourcequotas
      - replicasets
      - replicationcontrollers
      - serviceaccounts
      - services
    verbs:
      - get
      - list
      - watch
      - create
      - update
      - patch
      - delete


## Bind the role with service "role-bind.yml"
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: app-rolebinding
  namespace: webapps 
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role
  name: app-role 
subjects:
- namespace: webapps 
  kind: ServiceAccount
  name: jenkins           


## After role get binded with service account we need a token to communicate with eks cluster:
# Secret: create a 'secret.yml' file and create the Token.
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
  name: mysecretname
  namespace: webapps
  annotations:
    kubernetes.io/service-account.name: myserviceaccount

## apply all files:
kubectl apply -f "svc-account.yml"
kubectl apply -f "role.yml"
kubectl apply -f "role-bind.yml"
kubectl apply -f "secret.yml"

## List the Token 
kubectl describe secret mysecretname -n webapps


## To delete the EKS cluster and associated resources:
eksctl delete cluster --name EKS-1 --region ap-south-1 --force
eksctl get nodegroup --cluster=EKS-1	
eksctl delete nodegroup --cluster=EKS-1 --name=node2
