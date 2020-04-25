#!/bin/sh

echo "[provision] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.16.0.10 master.k8s.local kmaster
172.16.0.11 worker1.k8s.local kworker1
172.16.0.12 worker2.k8s.local kworker2
EOF

echo "[provision] Update OS"
yum update -q -y

echo "[provision] Install SCL"
yum install -q -y centos-release-scl
