# Argo CD
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://argo-cd.readthedocs.io/en/stable/getting_started/
## install
```sh
make help
```
## notes
config
```sh
kubectl config get-contexts
```
```sh
cat <<'EOF' >> .env.local
GITHUB_TOKEN=YOUR_GITHUB_TOKEN
EOF
```
browse GitHub [packages containers](https://github.com/anunca?ecosystem=container&tab=packages)
### Argo CD
install
```sh
make argocd.install
```
check pods
```sh
make argocd.ps
```
deploy argocd manifest
```sh
make argocd.apply
```
sync
- UI
    - use port forwarding to access
    ```sh
    make argocd.forward
    ```
    - retrieve admin password
    ```sh
    make argocd.password
    ```
    - browse [Argo CD](https://localhost:8080/)
- CLI
```sh
argocd app sync nginx-app
```
### check app
```sh
kubectl -n default get all
```
get local address to check
```sh
kubectl get svc nginx-service
```
forward nginx service
```sh
kubectl port-forward svc/nginx-service -n default 9000:80
```
browse [app](https://localhost:9000/)