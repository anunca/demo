cloud.config.init:
	bash sh/init-cloud-config.sh
multipass.launch:
	multipass launch -c4 -m16G -nk8s-master --cloud-init cloud-config.yaml
	multipass launch -c2 -m8G -nk8s-worker-one --cloud-init cloud-config.yaml
	multipass launch -c2 -m8G -nk8s-worker-two --cloud-init cloud-config.yaml
multipass.list:
	multipass list
ansible.hosts.config:
	bash sh/init-ansible-hosts.sh
ansible.hosts.test:
	ansible-playbook -i ansible/hosts ansible/playbook/ping.yml
# k8s.user:
# 	ansible-playbook -i ansible/hosts ansible/playbook/k8s-user.yml
k8s.dependencies:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-dependencies.yml
k8s.create.master:
	bash sh/init-k8s-master.sh
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-master.yml
k8s.create.worker:
	ansible-playbook -i ansible/hosts ansible/playbook/k8s-worker.yml
k8s.delete.cluster:
	multipass stop k8s-master k8s-worker-two k8s-worker-one
	multipass delete k8s-master k8s-worker-two k8s-worker-one
	multipass purge
	multipass list