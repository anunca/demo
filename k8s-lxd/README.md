# k8s-lxd

## docs
- [LXD][0]
- [LXD images][1]
- [K8S][2]

[0]:https://linuxcontainers.org/lxd/docs/master/
[1]:https://uk.images.linuxcontainers.org/
[2]:https://ubuntu.com/kubernetes/docs

## LXD install and launch containers
```sh
make lxd.install \
&& make launch
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
lxc exec k8s-master -- curl -s localhost:$PORT
lxc exec k8s-worker1 -- curl -s localhost:$PORT
lxc exec k8s-worker2 -- curl -s localhost:$PORT

kubectl create deployment httpd --image httpd
kubectl expose deployment httpd --port 80 --target-port 80 --type=NodePort
kubectl scale --replicas=10 deployment httpd
PORT=$(kubectl get service|grep httpd|awk '{print $5}'|cut -d ':' -f2|cut -d '/' -f1)
lxc exec k8s-master -- curl -s localhost:$PORT
lxc exec k8s-worker1 -- curl -s localhost:$PORT
lxc exec k8s-worker2 -- curl -s localhost:$PORT

K8S_MASTER_IP=$(lxc list|grep k8s-master|awk '{print $6}')
K8S_WORKER1_IP=$(lxc list|grep k8s-worker1|awk '{print $6}')
K8S_WORKER2_IP=$(lxc list|grep k8s-worker2|awk '{print $6}')

kubectl get nodes
kubectl get all
```

### LXD cli
```sh
lxd init --dump

lxc list

lxc info k8s-master

lxc config show k8s-master

lxc exec k8s-master -- /bin/bash
```