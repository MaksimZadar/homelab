Install traefik using following commands:

```bash
helm repo add traefik https://traefik.github.io/charts

helm repo update

helm install --create-namespace --namespace=traefik traefik traefik/traefik -f values.yaml
```
