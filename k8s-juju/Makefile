juju.install:
	sudo snap install juju --classic
list:
	juju machines
k8s.install:
	juju add-model k8s
	juju deploy charmed-kubernetes
kubectl.install:
	sudo snap install kubectl --classic
kubectl.config:
	if [ ! -d ${HOME}/.kube ]; then mkdir ${HOME}/.kube; else echo -e "${HOME}/.kube already created!"; fi
	juju scp kubernetes-master/0:config ${HOME}/.kube/config_juju_k8s \
	&& export KUBECONFIG=${KUBECONFIG}:${HOME}/.kube/config_juju_k8s \
	&& kubectl get nodes