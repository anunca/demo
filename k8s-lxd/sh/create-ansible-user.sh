#!/bin/sh

CONTAINERS='k8s-master k8s-worker1 k8s-worker2'

for C in $CONTAINERS;
do
  ANSIBLE_GROUPS=$(lxc exec $C -- groups ubuntu|sed s'/ubuntu : ubuntu //'|sed s'/ /,/g') \
  && lxc exec $C -- useradd -m -G$ANSIBLE_GROUPS -s/bin/bash ansible \
  && lxc exec $C -- bash -c 'echo -e "ansible\tALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansible' \
  && echo -e "\nAdded user ansible and sudoers to CONTAINER: $C\n" \
  && lxc exec $C -- groups ansible \
  && lxc exec $C -- cat /etc/sudoers.d/ansible
done