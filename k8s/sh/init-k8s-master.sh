POD_NETWORK_CIDR=$(multipass list|grep master|awk '{print $3}'|cut -d "." -f 1-2).0.0/16

cat <<EOF > ansible/playbook/k8s-master.yml
- hosts: master
  become: yes
  tasks:
    - name: initialize the cluster
      shell: kubeadm init --pod-network-cidr=$POD_NETWORK_CIDR >> cluster_initialized.txt
      args:
        chdir: /home/ansible
        creates: cluster_initialized.txt

    - name: create .kube directory
      become: yes
      become_user: ansible
      file:
        path: /home/ansible/.kube
        state: directory
        mode: 0755

    - name: copy admin.conf to user's kube config
      copy:
        src: /etc/kubernetes/admin.conf
        dest: /home/ansible/.kube/config
        remote_src: yes
        owner: ansible

    - name: install Pod network
      become: yes
      become_user: ansible
      shell: kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/a70459be0084506e4ec919aa1c114638878db11b/Documentation/kube-flannel.yml >> pod_network_setup.txt
      args:
        chdir: /home/ansible
        creates: pod_network_setup.txt
EOF

cat ansible/playbook/k8s-master.yml