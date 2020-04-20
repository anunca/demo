#!/bin/sh

SSH_ID_RSA_PUB=$(cat ~/.ssh/id_rsa.pub)

if [ -f "$SSH_ID_RSA_PUB" ]
then
  echo 'SSH_ID_RSA_PUB is null!'
  exit 1
fi

cat <<EOF > multipass/cloud-config.yaml
users:
  - name: ansible
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    ssh_import_id: None
    lock_passwd: true
    ssh_authorized_keys:
      - $SSH_ID_RSA_PUB
EOF

cat multipass/cloud-config.yaml