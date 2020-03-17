SSH_RSA_PUB=$(cat ~/.ssh/id_rsa.pub)

cat <<EOF > cloud-config.yaml
users:
  - name: ansible
    sudo: ALL=(ALL) NOPASSWD:ALL
    groups: users, admin
    ssh_import_id: None
    lock_passwd: true
    ssh_authorized_keys:
      - $SSH_RSA_PUB
EOF

cat cloud-config.yaml