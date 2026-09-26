#!/usr/bin/env bash

DOCKER_ENGINE_IP=$(multipass list|grep docker-engine|awk '{print $3}')

if [[ -z $DOCKER_ENGINE_IP ]]
then
  echo 'DOCKER_ENGINE_IP is null!'
  exit 1
fi

SSH_CONFIG_FILE="$HOME/.ssh/config"

if [[ ! -f "$SSH_CONFIG_FILE" ]]
then
  echo 'SSH_CONFIG_FILE does not exists!'
  exit 1
fi

cat <<EOF >> $SSH_CONFIG_FILE
Host $DOCKER_ENGINE_IP
  HostName $DOCKER_ENGINE_IP
  User ubuntu
  IdentityFile ~/.ssh/docker-engine
EOF

ZSH_FILE="$HOME/.zshrc"

if [[ ! -f "$ZSH_FILE" ]
then
  echo 'ZSH_FILE does not exists!'
  exit 1
fi

cat <<EOF >> $ZSH_FILE
export DOCKER_HOST="ssh://ubuntu@$DOCKER_ENGINE_IP"
EOF

cat $ZSH_FILE

cat <<EOF >> /etc/hosts
$DOCKER_ENGINE_IP docker.app.internal
EOF

cat /etc/hosts