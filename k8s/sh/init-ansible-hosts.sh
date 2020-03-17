K8S_MASTER_IP=$(multipass list|grep master|awk '{print $3}')
K8S_WORKER_ONE_IP=$(multipass list|grep worker-one|awk '{print $3}')
K8S_WORKER_TWO_IP=$(multipass list|grep worker-two|awk '{print $3}')

cat <<EOF > ansible/hosts
[masters]
master ansible_host=$K8S_MASTER_IP ansible_user=ansible ansible_ssh_private_key_file=$HOME/.ssh/id_rsa

[workers]
worker1 ansible_host=$K8S_WORKER_ONE_IP ansible_user=ansible ansible_ssh_private_key_file=$HOME/.ssh/id_rsa
worker2 ansible_host=$K8S_WORKER_TWO_IP ansible_user=ansible ansible_ssh_private_key_file=$HOME/.ssh/id_rsa

[all:vars]
ansible_python_interpreter=/usr/bin/python3
EOF

cat ansible/hosts