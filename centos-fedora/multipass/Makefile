launch.master:
	multipass launch -c6 -m8G -d128G -nk8s-master --cloud-init cloud-config.yaml
mount.master:
	multipass mount Docker k8s-master
launch.node:
	multipass launch -c6 -m8G -d128G -nk8s-node --cloud-init cloud-config.yaml
mount.node:
	multipass mount Docker k8s-node