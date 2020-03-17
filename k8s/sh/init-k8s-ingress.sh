HOST_IP=$(ifconfig eno2 | grep inet | head -1 | awk '{print $2}')

cat <<EOF > kubernetes/apache-ingress.yaml
apiVersion: extensions/v1beta1
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
apiVersion: extensions/v1beta1
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
apiVersion: extensions/v1beta1
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