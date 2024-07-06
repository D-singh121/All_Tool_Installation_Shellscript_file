#!/bin/bash
# Using apt commands
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update -y
sudo apt-get install helm -y
helm version

# OR

# # Easy way
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod 700 get_helm.sh
# ./get_helm.sh


# # Important Helm Commands  =>
# helm lint,
# helm template
# helm create [CHART]: Scaffold a new Helm chart.
# helm package [CHART]: Package the chart into a chart archive.
# helm install [NAME] [CHART]: Install a Helm chart.
# helm upgrade [NAME] [CHART]: Upgrade an installed Helm chart.
# helm uninstall [NAME]: Uninstall an installed Helm chart.
# helm list: List all installed Helm charts.
# helm rollback [NAME] [REVISION]: Roll back a release to a specific revision.