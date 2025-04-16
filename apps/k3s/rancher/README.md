## Instructions

Install the Rancher Helm repo:

```bash
helm repo add rancher-alpha https://releases.rancher.com/server-charts/alpha
```

Create a namespace for Rancher:

```bash
kubectl create namespace cattle-system
```

Create Cert Manager CRDs

```bash
kubectl apply --validate=false -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.16/cert-manager.crds.yaml
```

Add jetstack helm repo

```bash
helm repo add jetstack https://charts.jetstack.io ; helm repo update
```

Install cert manager helm chart

```bash
helm install cert-manager jetstack/cert-manager --namespace cert-manager
```

Install Rancher

```bash
helm install rancher rancher-alpha/rancher \
  --namespace cattle-system \
  --set hostname=rancher.domain \
  --set bootstrapPassword="YourPassword" \
  --devel
```
