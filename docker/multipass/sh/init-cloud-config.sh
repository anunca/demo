#!/usr/bin/env bash

SSH_KEY_FILE="$HOME/.ssh/docker-engine"

ssh-keygen -f "$SSH_KEY_FILE"

SSH_PUB_KEY_FILE="{$SSH_KEY_FILE}.pub"
SSH_PUB_KEY=$(cat $SSH_PUB_KEY_FILE)

if [[ ! -f "$SSH_PUB_KEY_FILE" ]]
then
  echo '$SSH_PUB_KEY_FILE does not exists!'
  exit 1
fi

sed "s/###SSH_PUB_KEY###/$SSH_PUB_KEY/" etc/cloud-config.template > etc/cloud-config.yaml

cat etc/cloud-config.yaml