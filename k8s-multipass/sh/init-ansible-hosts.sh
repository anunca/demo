#!/bin/sh

K8S_MASTER_IP=$(multipass list|grep master|awk '{print $3}')
K8S_WORKER1_IP=$(multipass list|grep worker1|awk '{print $3}')
K8S_WORKER2_IP=$(multipass list|grep worker2|awk '{print $3}')

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