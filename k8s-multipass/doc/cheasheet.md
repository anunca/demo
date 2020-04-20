# K8S cheatsheet

## docker 
```sh
#update user group
multipass exec k8s-master -- sudo usermod -aG docker ubuntu \
&& multipass exec k8s-worker1 -- sudo usermod -aG docker ubuntu \
&& multipass exec k8s-worker2 -- sudo usermod -aG docker ubuntu

#checkout docker
multipass exec k8s-master -- docker images \
&& multipass exec k8s-worker1 -- docker images \
&& multipass exec k8s-worker2 -- docker images

multipass exec k8s-master -- docker ps -a \
&& multipass exec k8s-worker1 -- docker ps -a\
&& multipass exec k8s-worker2 -- docker ps -a

multipass exec k8s-master -- docker container prune -f \
&& multipass exec k8s-worker1 -- docker container prune -f \
&& multipass exec k8s-worker2 -- docker container prune -f
```

## Linux iptables (kuberntes >= v1.17)
```sh
#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm

#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#letting-iptables-see-bridged-traffic
multipass exec k8s-master -- sudo sh -c "cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF"

multipass exec k8s-worker1 -- sudo sh -c "cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF"

multipass exec k8s-worker2 -- sudo sh -c "cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF"

multipass exec k8s-master -- sudo cat /etc/sysctl.d/k8s.conf \
&& multipass exec k8s-worker1 -- sudo cat /etc/sysctl.d/k8s.conf \
&& multipass exec k8s-worker2 -- sudo cat /etc/sysctl.d/k8s.conf

multipass exec k8s-master -- sudo sysctl --system \
&& multipass exec k8s-worker1 -- sudo sysctl --system \
&& multipass exec k8s-worker2 -- sudo sysctl --system

#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#check-required-ports
multipass exec k8s-master -- sudo systemctl stop ufw \
&& multipass exec k8s-worker1 -- sudo systemctl stop ufw \
&& multipass exec k8s-worker2 -- sudo systemctl stop ufw

multipass exec k8s-master -- sudo systemctl disable ufw \
&& multipass exec k8s-worker1 -- sudo systemctl disable ufw \
&& multipass exec k8s-worker2 -- sudo systemctl disable ufw
```

## cluster ports
```sh
#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/#verify-the-mac-address-and-product-uuid-are-unique-for-every-node
multipass exec k8s-master -- ifconfig -a \
&& multipass exec k8s-worker1 -- ifconfig -a \
&& multipass exec k8s-worker2 -- ifconfig -a

multipass exec k8s-master -- ip link \
&& multipass exec k8s-worker1 -- ip link \
&& multipass exec k8s-worker2 -- ip link

multipass exec k8s-master -- sudo netstat -tln \
&& multipass exec k8s-worker1 -- sudo netstat -tln \
&& multipass exec k8s-worker2 -- sudo netstat -tln

multipass exec k8s-master -- sudo iptables -L -n -v\
&& multipass exec k8s-worker1 -- sudo iptables -L -n -v\
&& multipass exec k8s-worker2 -- sudo iptables -L -n -v

multipass exec k8s-master -- sudo systemctl status ufw \
&& multipass exec k8s-worker1 -- sudo systemctl status ufw \
&& multipass exec k8s-worker2 -- sudo systemctl status ufw

multipass exec k8s-master -- sudo snap install nmap \
&& multipass exec k8s-worker1 -- sudo snap install nmap \
&& multipass exec k8s-worker2 -- sudo snap install nmap

#check ports are opened
multipass exec k8s-master -- /snap/bin/nmap localhost -p 6443 \
&& /snap/bin/nmap localhost -p 2379-2380 \
&& /snap/bin/nmap localhost -p 10250 \
&& /snap/bin/nmap localhost -p 10251 \
&& /snap/bin/nmap localhost -p 10252

multipass exec k8s-worker1 -- /snap/bin/nmap localhost -p 10250 \
&& /snap/bin/nmap localhost -p 30000-32767

multipass exec k8s-worker2 -- /snap/bin/nmap localhost -p 10250 \
&& /snap/bin/nmap localhost -p 30000-32767

#test services port on cluster
SERVICE_NAME=apache
PORT=`kubectl get svc|grep -w $SERVICE_NAME|awk '{print $5}'|cut -d ':' -f2|cut -d '/' -f1`

IP=$(multipass list|grep master|awk '{print $3}')
multipass exec k8s-master -- /snap/bin/nmap $IP -p $PORT

IP=$(multipass list|grep worker1|awk '{print $3}')
multipass exec k8s-worker1 -- /snap/bin/nmap $IP -p $PORT

IP=$(multipass list|grep worker2|awk '{print $3}')
multipass exec k8s-worker2 -- /snap/bin/nmap $IP -p $PORT

IP=$(multipass list|grep master|awk '{print $3}')
multipass exec k8s-master -- curl $IP:$PORT

IP=$(multipass list|grep worker1|awk '{print $3}')
multipass exec k8s-worker1 -- curl $IP:$PORT

IP=$(multipass list|grep worker2|awk '{print $3}')
multipass exec k8s-worker2 -- curl $IP:$PORT
```

## Flannel
```sh
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

 multipass exec k8s-master -- sudo cat /run/flannel/subnet.env \
 && multipass exec k8s-worker1 -- sudo cat /run/flannel/subnet.env \
 && multipass exec k8s-worker2 -- sudo cat /run/flannel/subnet.env
```

## Calico
```sh
#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#pod-network
#https://kubernetes.io/docs/concepts/cluster-administration/addons/#networking-and-network-policy
#For Kubernetes v1.7+
#https://github.com/coreos/flannel/blob/master/Documentation/kubernetes.md
#TODO check why this one is not working
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
```

## kubectl 
```sh
#https://kubernetes.io/fr/docs/reference/kubectl/cheatsheet/
kubectl version --client

kubectl get events -w
kubectl create secrets docker-registry docker-private-registry --docker-server $IP:$PORT --docker-username $USER --docker-password $PASSWORD
kubectl run nginx --image $IP:$PORT/nginx --image-pull-policy Always --dry-run -d yaml > nginx.yaml

# kubectl create deployment nginx --image=nginx
kubectl create deployment nginx --image=nginx --dry-run -o yaml > kubernetes/nginx-deployment.yaml
kubectl apply -f kubernetes/nginx-deployment.yaml

# kubectl create deployment nginx --image=nginx --dry-run -o yaml > kubernetes/nginx-deployment.yaml
# kubectl expose deployment nginx --port 80 --target-port 80 --type=NodePort --dry-run -o yaml > kubernetes/nginx-service.yaml
# kubectl create deployment apache --image=httpd --dry-run -o yaml > kubernetes/apache-deployment.yaml
# kubectl expose deployment apache --port 80 --target-port 80 --type=NodePort --dry-run -o yaml > kubernetes/apache-service.yaml
# kubectl create deployment gitlab --image=gitlab/gitlab-ce --dry-run -o yaml > kubernetes/gitlab-deployment.yaml
# kubectl expose deployment gitlab --port 80 --target-port 80 --type=NodePort --dry-run -o yaml > kubernetes/gitlab-service.yaml

# HOST_IP=$(ifconfig eno2 | grep inet | head -1 | awk '{print $2}')
# kubectl port-forward $(kubectl get pods | grep nginx | head -n1 | awk '{print $1}') --address localhost,$HOST_IP  8080:80

# kubectl expose deployment nginx --port 80 --target-port 80
# kubectl expose deployment nginx --port 80 --target-port 80 --type=NodePort
# kubectl expose deployment nginx --port 80 --target-port 80 --type=LoadBalancer

kubectl describe deployment nginx
kubectl describe service nginx

# apiVersion: extensions/v1beta1
# kind: Deployment
# metadata:
#   name: nginx
# spec:
#   replicas: 1
#     spec:
#       containers:
#       - image: $IP:$PORT/nginx
#         name: nginx
#         imagePullPolicy: Always
#       restartPolicy: Always
#       imagePullSecrets:
#         - name: docker-private-registry
kubectl get all --all-namespaces
kubectl delete pods --all -ndefault
kubectl delete pods --all -ningress-nginx
#list pods in nodes
kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name -ndefault
kubectl get pod -o=custom-columns=NODE:.spec.nodeName,NAME:.metadata.name --all-namespaces
kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName
kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces

kubectl get cs -o wide
kubectl get nodes -o wide
multipass exec k8s-master -- sudo kubeadm config view

#https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/#tear-down
kubectl drain
kubectl uncordon
```

## kubectl install and config
```sh
#install kubectl
sudo snap install kubectl --classic
#create config
mkdir $HOME/.kube
multipass exec k8s-master -- sudo cat /etc/kubernetes/admin.conf > $HOME/.kube/config
#or
multipass exec k8s-master -- sudo kubectl config view --raw > $HOME/.kube/config
```

## Add route
```sh
# multipass list|awk '{print $3}'
# NETWORK=$(multipass list|grep master|awk '{print $3}'|cut -d "." -f 1-2).0.0/16

kubectl get nodes -owide|awk '{print $6}'
NETWORK=$(kubectl get nodes -owide|grep master|awk '{print $6}'|cut -d "." -f 1-3).0/24
GATEWAY=$(ifconfig eno2 | grep inet | head -1 | awk '{print $2}')
echo sudo route -n add -net $NETWORK $GATEWAY

netstat -rn

echo sudo route -n delete -net $NETWORK $GATEWAY
```