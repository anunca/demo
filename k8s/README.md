# K8S

## Multipass
```sh
#install multipass
sudo snap install multipass --classic

#config and install K8S cluster
make cloud.config.init
make multipass.launch
make multipass.list | awk '{print $1, $3}'
```

## Ansible

### install
```sh
sudo apt update
sudo apt install software-properties-common
sudo apt-add-repository --yes --update ppa:ansible/ansible
sudo apt install ansible
```

### config hosts
make ansible.hosts.config
### test hosts
make ansible.hosts.test

### install master and worker k8s dependencies
make k8s.install

### create master
```sh
make k8s.create.master

# check master is ready
# multipass exec k8s-master -- kubectl get nodes
# multipass shell k8s-master
ssh -i ~/.ssh/id_rsa ansible@$(multipass list|grep master|awk '{print $3}')
kubectl get nodes
```

### create workers
```sh
make k8s.create.worker

# check workers are ready
# multipass exec k8s-worker-one -- kubectl get nodes
# multipass shell k8s-worker-one
#TODO check this
ssh -i ~/.ssh/id_rsa ansible@$(multipass list|grep worker-one|awk '{print $3}')
kubectl get nodes

# multipass exec k8s-worker-two -- kubectl get nodes
# multipass shell k8s-worker-two
#TODO check this
ssh -i ~/.ssh/id_rsa ansible@$(multipass list|grep worker-two|awk '{print $3}')
kubectl get nodes
```

### kubectl config
```sh
#install kubectl
sudo snap install kubectl --classic
#create config
mkdir $HOME/.kube
multipass exec k8s-master -- cat /home/ansible/.kube/config > $HOME/.kube/config
cat $HOME/.kube/config
#check config
kubectl get nodes
```

### Test Kubernetes nodes

#### nginx
```sh
K8S_MASTER_IP=$(multipass list|grep master|awk '{print $3}')
K8S_WORKER_ONE_IP=$(multipass list|grep worker-one|awk '{print $3}')
K8S_WORKER_TWO_IP=$(multipass list|grep worker-two|awk '{print $3}')

kubectl create deployment nginx --image=nginx
kubectl expose deploy nginx --port 80 --target-port 80 --type NodePort

kubectl get all|grep nginx

kubectl delete service nginx
kubectl delete deployment nginx
```

#### apache
```sh
kubectl create deployment apache --image=httpd
kubectl expose deploy apache --port 80 --target-port 80 --type NodePort

kubectl get all|grep apache

kubectl delete service apache
kubectl delete deployment apache
```

#### gitlab
```sh
kubectl create deployment gitlab --image=gitlab/gitlab-ce
kubectl expose deploy gitlab --port 80 --target-port 80 --type NodePort

kubectl get all|grep gitlab

kubectl delete service gitlab
kubectl delete deployment gitlab
```

## Kubernetes Ingress
```sh
# https://kubernetes.github.io/ingress-nginx/deploy/
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/baremetal/service-nodeport.yaml

bash sh/init-k8s-ingress.sh

kubectl apply -f kubernetes/nginx-ingress.yaml
kubectl apply -f kubernetes/apache-ingress.yaml
kubectl apply -f kubernetes/gitlab-ingress.yaml
```

## Add route
```sh
multipass list|awk '{print $3}'
POD_NETWORK_CIDR=$(multipass list|grep master|awk '{print $3}'|cut -d "." -f 1-2).0.0/16
HOST_IP=$(ifconfig eno2 | grep inet | head -1 | awk '{print $2}')
sudo route -n add -net $POD_NETWORK_CIDR $HOST_IP
netstat -rn
```

## Mutltipass delete cluster
```sh
make k8s.delete.cluster
```