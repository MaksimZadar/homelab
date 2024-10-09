# K8s Dashboard

## Installation

1. Installation is done using helm.

```bash
# Add kubernetes-dashboard repository
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
# Deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
```

2. Then run

```bash
kubectl apply -f dashboard-adminaccount.yaml && kubectl apply -f clustering-role.yaml
```
