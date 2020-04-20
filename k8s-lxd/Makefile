lxd.install:
	sudo snap install lxd
	# lxd init
disable.swap:
	sudo swapoff -a
	swapon --show
	sudo sed -i 's/^\/swapfile/#\/swapfile/' /etc/fstab
launch:
	make disable.swap
	lxc launch ubuntu:18.04 k8s-master
	lxc launch ubuntu:18.04 k8s-worker1
	lxc launch ubuntu:18.04 k8s-worker2
	lxc launch ubuntu:18.04 haproxy
	lxc launch ubuntu:18.04 nfs
start:
	lxc start k8s-master k8s-worker1 k8s-worker2 haproxy nfs
stop:
	lxc stop k8s-master k8s-worker1 k8s-worker2 haproxy nfs
restart:
	lxc restart k8s-master k8s-worker1 k8s-worker2 haproxy nfs
delete:
	lxc delete k8s-master k8s-worker1 k8s-worker2 haproxy nfs
list:
	lxc list|grep k8s
ansible.install:
	sudo apt update
	sudo apt install -y software-properties-common
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install -y ansible
create.ansible.user:
	bash sh/create-ansible-user.sh
delete.ansible.user:
	lxc exec k8s-master -- userdel -fr ansible
	lxc exec k8s-worker1 -- userdel -fr ansible
	lxc exec k8s-worker2 -- userdel -fr ansible
ssh.ansible.copy.id:
	bash sh/ssh-ansible-copy-id.sh
ansible.config:
	make create.ansible.user
	make ssh.ansible.copy.id
	bash sh/init-ansible-hosts.sh
	ansible-playbook -i ansible/hosts ansible/playbook/ping.yml
k8s.install:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-install.yml
k8s.create.master:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-master.yml
k8s.create.worker:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-worker.yml
k8s.delete.cluster:
	make stop
	make delete
	make list
kubectl.install:
	sudo snap install kubectl --classic
kubectl.config:
	if [ ! -d ${HOME}/.kube ]; then mkdir ${HOME}/.kube; else echo -e "${HOME}/.kube already created!"; fi
	&& lxc exec k8s-master -- sudo su -c "kubectl config view --raw" ansible > $HOME/.kube/config_lxd_k8s \
	&& export KUBECONFIG=${KUBECONFIG}:${HOME}/.kube/config_lxd_k8s \
	&& kubectl get nodes