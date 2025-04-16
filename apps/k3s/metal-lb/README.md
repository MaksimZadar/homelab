## Install MetalLB

```bash
# First add metallb repository to your helm
helm repo add metallb https://metallb.github.io/metallb

# Check if it was found
helm search repo metallb

# Install metallb
helm upgrade --install metallb metallb/metallb --create-namespace --namespace metallb-system --wait
```
