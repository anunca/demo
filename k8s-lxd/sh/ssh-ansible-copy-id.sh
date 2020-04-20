#!/bin/sh

CONTAINERS='k8s-master k8s-worker1 k8s-worker2'
SSH_ID_RSA_PUB=$(ls $HOME/.ssh/id_rsa.pub)

for C in $CONTAINERS;
do
	lxc exec $C -- su -c 'mkdir /home/ansible/.ssh' ansible \
	&& lxc file push $SSH_ID_RSA_PUB $C/home/ansible/.ssh/authorized_keys \
	&& lxc exec $C -- chown ansible:ansible /home/ansible/.ssh/authorized_keys \
	&& echo -e "\nAdded ansible authorized_keys to CONTAINER: $C\n" \
  && lxc exec $C -- ls -lah /home/ansible/.ssh
done