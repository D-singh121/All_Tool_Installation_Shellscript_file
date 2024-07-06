#!/bin/bash
# before installing the argocd make sure the kubernetes cluster is running.

# this script will install argocd on the kubernetes cluster.
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# check installation done.
kubectl get all -n argocd

# # check the service 
# kubectl get svc -n argocd
#  # argocd-server   ClusterIP   10.106.97.191    <none>        80/TCP,443/TCP               4m48s
#  # change this argocd-server service type from clusterip to the NodePort type.
# kubectl edit svc argocd-server

# # Now we will do port forwording of argocd-server service for browser use.
# minikube service argocd-server -n argocd
# #--> It will give a url to access the argocd on browser.
#  #--Like this--> http://192.168.39.42:30145    
 
# # now we know the user is "admin" for argocd and the password we can get by running the below cammand 
# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo


# # remove all argocd pods , deploy and services
# kubectl delete pods -n argocd --all
# kubectl delete deployments -n argocd --all
# kubectl delete services -n argocd --all



# ## argocd cli way installing and  login and procedding 
# 	# INSTALL argocd cli 
# 	curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
# 	sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
# 	rm argocd-linux-amd64
	
# 	# Login into argocd cli 
# 	argocd login localhost_ip:NodePort_ip # (eg . argocd login 192.168.39.41:32634 )
# 	# provide username and password then it will look like this 
# 		'admin:login' logged in successfully
# 		 Context '192.168.39.41:32634' updated	


# ## Some importent notes :
# In Argo CD, when syncing applications, you have various options and flags available to control the synchronization process. Here is a brief explanation of each option you have listed:

# 1. PRUNE: Removes resources from the target cluster that are no longer tracked in the Git repository. This helps to ensure that the target cluster matches the desired state defined in the Git repository.

# 2. DRY RUN: Simulates the sync operation without actually making any changes to the target cluster. This is useful for previewing the changes that would be applied before actually applying them.

# 3. APPLY ONLY: Only applies changes to the target cluster without syncing the entire application. This is useful when you want to apply specific changes without performing a full synchronization.

# 4. FORCE: Forces the sync operation to proceed even if there are warnings or errors. This is useful for overriding certain conditions that might prevent the sync operation from proceeding.

# 5. SYNC OPTIONS: Various options that control how the sync operation is performed, such as skip schema validation, auto-create namespace, prune last, apply out of sync only, respect ignore differences, server-side apply, prune propagation policy, etc.

# 6. PRUNE PROPAGATION POLICY: Specifies the strategy used for pruning resources during the sync operation. In this case, it is set to "foreground", indicating that pruning will be performed in the foreground, meaning resources are pruned sequentially.

# 7. REPLACE: Indicates that resources should be replaced during the sync operation if they already exist in the target cluster.

# 8. RETRY: Specifies the number of times to retry the sync operation if it fails initially.

# These options and flags provide fine-grained control over the synchronization process in Argo CD, allowing you to tailor the sync operation according to your specific requirements and preferences.