# Argo CD GitOps lab

Deploy a small nginx application to Kubernetes and let Argo CD reconcile its desired state from Git.

## Requirements

- Docker with Compose v2 (only needed to build the sample image)
- Kubernetes cluster with a current context
- `kubectl`
- optional: Argo CD CLI

Confirm the target cluster before applying anything:

```sh
kubectl config current-context
kubectl cluster-info
```

## Build the sample image

```sh
make config
make build
```

The Kubernetes manifest expects `ghcr.io/anunca/nginx-app:prod`. If the package is private, create the `ghcr-secret` image-pull secret in the target namespace.

## Install Argo CD

```sh
make argocd.install
make argocd.ps
```

Apply the Application resource:

```sh
make argocd.apply
```

The Application tracks `main` under `argocd/k8s` and has automated pruning and self-healing enabled.

## Access Argo CD

```sh
make argocd.forward
```

In another terminal, retrieve the initial admin password:

```sh
make argocd.password
```

Then open <https://localhost:8080/>.

With the CLI:

```sh
argocd app get nginx-app
argocd app sync nginx-app
```

## Inspect the workload

```sh
kubectl get deployment,service,pod
kubectl port-forward svc/nginx 9000:80
```

Open <http://localhost:9000/>.

## Notes

The deployment uses readiness/liveness probes, resource requests/limits, standard Kubernetes labels, and a ClusterIP service. This is a learning lab; adapt image provenance, namespaces, RBAC, network policies, and resource sizing before using the pattern in production.
