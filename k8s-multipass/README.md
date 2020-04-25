# k8s-multipass

## Multipass

### install and launch vms
```sh
make multipass.install \
&& make cluster.launch
```

### delete cluster
```sh
make cluster.purge
```

## Ansible install and config
```sh
make ansible.install \
&& make ansible.config
```

## K8S install and config
```sh
make k8s.install \
&& make k8s.create.master \
&& make k8s.create.worker
```

## kubectl install and config
```sh
make kubectl.install \
&& make kubectl.config
```

## LB
```sh
make lb.install
```

## HPA
```sh
#TODO
#https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/
#https://github.com/kubernetes-sigs/metrics-server
kubectl autoscale deployment/nginx --cpu-percent=50 --min=5 --max=10
kubectl get hpa
kubectl delete horizontalpodautoscalers.autoscaling nginx
kubectl get hpa
```

## basics operations

### K8S cli

#### nginx
```sh
kubectl apply -f kubernetes/nginx-deployment.yaml \
&& kubectl apply -f kubernetes/nginx-service.yaml \
&& kubectl scale --replicas=10 deployment nginx

kubectl delete -f kubernetes/nginx-service.yaml \
&& kubectl delete -f kubernetes/nginx-deployment.yaml
```

#### apache
```sh
kubectl apply -f kubernetes/apache-deployment.yaml \
&& kubectl apply -f kubernetes/apache-service.yaml \
&& kubectl scale --replicas=10 deployment apache

kubectl delete -f kubernetes/apache-service.yaml \
&& kubectl delete -f kubernetes/apache-deployment.yaml
```

#### gitlab
```sh
kubectl apply -f kubernetes/gitlab-deployment.yaml \
&& kubectl apply -f kubernetes/gitlab-service.yaml

kubectl delete -f kubernetes/gitlab-service.yaml \
&& kubectl delete -f kubernetes/gitlab-deployment.yaml
```

#### ingress
```sh
kubectl get pods --all-namespaces -l app.kubernetes.io/name=ingress-nginx --watch

bash sh/init-k8s-ingress-resource.sh

kubectl apply -f kubernetes/nginx-ingress.yaml \
&& kubectl apply -f kubernetes/apache-ingress.yaml \
&& kubectl apply -f kubernetes/gitlab-ingress.yaml

bash sh/test-k8s-ingress-resource.sh

kubectl delete -f kubernetes/nginx-ingress.yaml \
&& kubectl delete -f kubernetes/apache-ingress.yaml \
&& kubectl delete -f kubernetes/gitlab-ingress.yaml
```