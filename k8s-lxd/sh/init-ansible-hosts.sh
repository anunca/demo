#!/bin/sh

K8S_MASTER_IP=$(lxc exec k8s-master -- ip a|grep eth0|grep inet|awk {'print $2'}|cut -d '/' -f1)
K8S_WORKER1_IP=$(lxc exec k8s-worker1 -- ip a|grep eth0|grep inet|awk {'print $2'}|cut -d '/' -f1)
K8S_WORKER2_IP=$(lxc exec k8s-worker2 -- ip a|grep eth0|grep inet|awk {'print $2'}|cut -d '/' -f1)

if [ -z $K8S_MASTER_IP ]
then
  echo 'K8S_MASTER_IP is null!'
  exit 1
fi

if [ -z $K8S_WORKER1_IP ]
then
  echo 'K8S_WORKER1_IP is null!'
  exit 1
fi

if [ -z $K8S_WORKER2_IP ]
then
  echo 'K8S_WORKER2_IP is null!'
  exit 1
fi

if [[ $K8S_MASTER_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
then
  echo -e 'K8S_MASTER_IP is regular!\n'
else
  echo 'K8S_MASTER_IP is not regular!'
  exit 1
fi

if [[ $K8S_WORKER1_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
then
  echo -e 'K8S_WORKER1_IP is regular!\n'
else
  echo 'K8S_WORKER1_IP is not regular!'
  exit 1
fi

if [[ $K8S_WORKER2_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
then
  echo -e 'K8S_WORKER2_IP is regular!\n'
else
  echo 'K8S_WORKER2_IP is not regular!'
  exit 1
fi

cat <<EOF > ansible/hosts
[masters]
master ansible_host=$K8S_MASTER_IP ansible_user=ansible ansible_ssh_private_key_file=$HOME/.ssh/id_rsa

[workers]
worker1 ansible_host=$K8S_WORKER1_IP ansible_user=ansible ansible_ssh_private_key_file=$HOME/.ssh/id_rsa
worker2 ansible_host=$K8S_WORKER2_IP ansible_user=ansible ansible_ssh_private_key_file=$HOME/.ssh/id_rsa

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOF

cat ansible/hosts