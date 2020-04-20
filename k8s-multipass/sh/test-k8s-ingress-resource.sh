#!/bin/sh

HOST_IP=$(ifconfig eno2 | grep inet | head -1 | awk '{print $2}')

if [ -z $HOST_IP ]
then
  HOST_IP=$(ifconfig en0 | grep -w inet|head -1 | awk '{print $2}')
fi

if [ -z $HOST_IP ]
then
  echo 'HOST_IP is null!'
  exit 1
fi

if [[ $HOST_IP =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]
then
  echo -e 'HOST_IP is regular!\n'
else
  echo 'HOST_IP is not regular!'
  exit 1
fi

curl -H"Host: nginx.$HOST_IP.xip.io" $HOST_IP
curl -H"Host: apache.$HOST_IP.xip.io" $HOST_IP
curl -H"Host: gitlab.$HOST_IP.xip.io" $HOST_IP