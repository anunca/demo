#!/bin/sh

HOST_IP=$(ifconfig eno2 | grep inet | head -1 | awk '{print $2}')

if [ -z $HOST_IP ]
then
  HOST_IP=$(ifconfig en0 | grep -w inet|head -1 | awk '{print $2}')
fi

if [ -z $HOST_IP ]
then
  echo 'HOST_IP is null!'
  exit 1
fi

if [[ $HOST_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
then
  echo -e 'HOST_IP is regular!\n'
else
  echo 'HOST_IP is not regular!'
  exit 1
fi

K8S_VERSION=$(kubectl version --short|grep -iserver|cut -d 'v' -f3|cut -d '.' -f1-2)
if [[ $(echo "$K8S_VERSION >= 1.14" |bc -l) -eq 1 ]]
then
  K8S_INGRESS_API_VERSION=networking.k8s.io/v1beta1
else
  K8S_INGRESS_API_VERSION=extensions/v1beta1
fi

cat <<EOF > kubernetes/apache-ingress.yaml
apiVersion: $K8S_INGRESS_API_VERSION
kind: Ingress
metadata:
  name: apache
spec:
  rules:
    - host: apache.$HOST_IP.xip.io
      http:
        paths:
          - backend:
              serviceName: apache
              servicePort: 80
EOF

cat kubernetes/apache-ingress.yaml

cat <<EOF > kubernetes/gitlab-ingress.yaml
apiVersion: $K8S_INGRESS_API_VERSION
kind: Ingress
metadata:
  name: gitlab
spec:
  rules:
    - host: gitlab.$HOST_IP.xip.io
      http:
        paths:
          - backend:
              serviceName: gitlab
              servicePort: 80
EOF

cat kubernetes/gitlab-ingress.yaml

cat <<EOF > kubernetes/nginx-ingress.yaml
apiVersion: $K8S_INGRESS_API_VERSION
kind: Ingress
metadata:
  name: nginx
spec:
  rules:
    - host: nginx.$HOST_IP.xip.io
      http:
        paths:
          - backend:
              serviceName: nginx
              servicePort: 80
EOF

cat kubernetes/nginx-ingress.yaml