multipass.install:
	sudo snap install multipass --classic
cloud.config:
	bash sh/init-cloud-config.sh
cluster.launch:
	make cloud.config
	multipass launch -c4 -m16G -nk8s-master 16.04 --cloud-init multipass/cloud-config.yaml
	multipass launch -c2 -m8G -nk8s-worker1 16.04 --cloud-init multipass/cloud-config.yaml
	multipass launch -c2 -m8G -nk8s-worker2 16.04 --cloud-init multipass/cloud-config.yaml
	make list
cluster.purge:
	make stop
	make delete
	make purge
	make list
start:
	multipass start k8s-master k8s-worker1 k8s-worker2
stop:
	multipass stop k8s-master k8s-worker1 k8s-worker2
restart:
	multipass restart k8s-master k8s-worker1 k8s-worker2
delete:
	multipass delete k8s-master k8s-worker1 k8s-worker2
purge:
	multipass purge
list:
	multipass list
ansible.install:
	sudo apt update
	sudo apt install -y software-properties-common
	sudo apt-add-repository --yes --update ppa:ansible/ansible
	sudo apt install -y ansible
ansible.config:
	bash sh/init-ansible-hosts.sh
	ansible-playbook -i ansible/hosts ansible/playbook/ping.yml
k8s.install:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-install.yml
k8s.create.master:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-master.yml
k8s.kubectl.config:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-kubectl-config.yml
k8s.create.worker:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-worker.yml
kubectl.install:
	sudo snap install kubectl --classic
kubectl.config:
	if [ ! -d ${HOME}/.kube ]; then mkdir ${HOME}/.kube; else echo -e "${HOME}/.kube already created!"; fi
	multipass exec k8s-master -- sudo su -c "kubectl config view --raw" ansible > ${HOME}/.kube/config_multipass_k8s \
	&& export KUBECONFIG=${KUBECONFIG}:${HOME}/.kube/config_multipass_k8s \
	&& kubectl get nodes
lb.install:
	bash sh/init-haproxy-config.sh
	bash sh/start-haproxy.sh