# k8s-juju

## docs
- [Juju][0]
- [K8s][1]

[0]:https://juju.is/docs
[1]:https://ubuntu.com/kubernetes/docs

## Juju install
```sh
make juju.install
```

## K8S install
```sh
make k8s.install \
&& juju status --color
```

## kubectl install and config
```sh
make kubectl.install \
&& make kubectl.config
```

## basics operations

### K8S cli
```sh
kubectl config current-context

kubectl cluster-info
kubectl cluster-info dump

kubectl create deployment nginx --image nginx
kubectl expose deployment nginx --port 80 --target-port 80 --type=NodePort
kubectl scale --replicas=10 deployment nginx
PORT=$(kubectl get service|grep nginx|awk '{print $5}'|cut -d ':' -f2|cut -d '/' -f1)
juju exec --machine 7 -- curl -s localhost:$PORT
juju exec --machine 8 -- curl -s localhost:$PORT
juju exec --machine 9 -- curl -s localhost:$PORT

kubectl create deployment httpd --image httpd
kubectl expose deployment httpd --port 80 --target-port 80 --type=NodePort
kubectl scale --replicas=10 deployment httpd
PORT=$(kubectl get service|grep httpd|awk '{print $5}'|cut -d ':' -f2|cut -d '/' -f1)
juju exec --machine 7 -- curl -s localhost:$PORT
juju exec --machine 8 -- curl -s localhost:$PORT
juju exec --machine 9 -- curl -s localhost:$PORT


kubectl get nodes
kubectl get all
```

### Juju cli
```sh
lxc list
juju machines

juju controllers

juju models

juju debug-log

juju ssh kubernetes-master/0

juju run-action kubernetes-worker/0 microbot replicas=3 --wait

juju add unit -n 2 kubernetes-master

juju add unit -n 2 kubernetes-worker

juju list-clouds

juju export-bundle --filename mybundle.yaml

juju config kubernetes-worker

juju destroy-model k8s
```