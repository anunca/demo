#!/bin/sh

K8S_MASTER=`kubectl get nodes -o wide|tail -n3|awk '{print $6}'|sed '1q;d'`
K8S_WORKER1=`kubectl get nodes -o wide|tail -n3|awk '{print $6}'|sed '2q;d'`
K8S_WORKER2=`kubectl get nodes -o wide|tail -n3|awk '{print $6}'|sed '3q;d'`
sed "s/#MASTER#/$K8S_MASTER/; s/#WORKER1#/$K8S_WORKER1/; s/#WORKER2#/$K8S_WORKER2/" ./lb/haproxy/haproxy.tmp > ./lb/haproxy/haproxy.cfg