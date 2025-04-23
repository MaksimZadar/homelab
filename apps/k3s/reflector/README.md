Install using following commands:

```bash
helm repo add emberstack https://emberstack.github.io/helm-charts

helm repo update

helm upgrade --install reflector --create-namespace --namespace traefik emberstack/reflector
```
