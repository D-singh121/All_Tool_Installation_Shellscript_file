#!/bin/bash
## ----------------------------- Prometheus setup on k8s cluster-----------------------------------##
# # prerequisites.
# 	1. HELM 
# 	2. k8s Cluster
# 	3. kubectl
	
					## Prometheus Install ##
					
# 1. Add the Prometheus Community Helm repository to your Kubernetes cluster
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# 2. -------- Update the Helm repository 
	helm repo update

# 3. -------- prometheus 
	helm install prometheus prometheus-community/kube-prometheus-stack    
	kubectl get all
	# helm uninstall prometheus  <---- for uninstall 
	# kubectl delete all -l release=prometheus
	
# 4. Expose promethus service
	kubectl expose service prometheus-server --type=NodePort --target-port=9090 --name=prometheus-server-ext

# # 5. -------- for deleting all prometheus resource
# 	helm uninstall  prometheus
# 	kubectl delete all -l release=prometheus



					## Grafana Install ##
	
# 1. -------- Add the grafana repo 
	helm repo add grafana https://grafana.github.io/helm-charts

# 2. ------- Update helm repo
	helm repo update

# 3. ------- Install helm
	helm install grafana grafana/grafana	
	
# 4. ------- Expose Grafana Service
	kubectl expose service grafana  --type=NodePort  --target-port=3000  --name=grafana-ext
	
# # 5. -------- for deleting all grafana resource	
# 	helm uninstall grafana 
# 	kubectl delete all -l release=grafana

	
				
### . Check the installation of prometheus & grafana 
	kubectl get all 

# # grafana notes 
# 1. Get your 'admin' user password by running:
#    kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


# 2. The Grafana server can be accessed via port 80 on the following DNS name from within your cluster:
#    grafana.default.svc.cluster.local

#    Get the Grafana URL to visit by running these commands in the same shell:
#      export POD_NAME=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=grafana,app.kubernetes.io/instance=grafana" -o jsonpath="{.items[0].metadata.name}")
#      kubectl --namespace default port-forward $POD_NAME 3000
