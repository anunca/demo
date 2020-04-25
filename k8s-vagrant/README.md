# k8s-vagrant

## Vagrant

### install and launch vms
```sh
make vagrant.install \
&& make cluster.launch
```

### delete cluster
```sh
make cluster.remove
```

## basics operations

### Vagrant cli
```sh
vagrant ssh k8s-master
vagrant ssh k8s-worker1
vagrant ssh k8s-worker2

sudo -i

vagrant ssh k8s-master -c "uname -r" \
&& vagrant ssh k8s-worker1 -c "uname -r" \
&& vagrant ssh k8s-worker2 -c "uname -r"

vagrant ssh k8s-master -c "cat /etc/centos-release" \
&& vagrant ssh k8s-worker1 -c "cat /etc/centos-release" \
&& vagrant ssh k8s-worker2 -c "cat /etc/centos-release"

vagrant ssh k8s-master -c "ip a show eth0" \
&& vagrant ssh k8s-worker1 -c "ip a show eth0" \
&& vagrant ssh k8s-worker2 -c "ip a show eth0"
```
