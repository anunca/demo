#!/usr/bin/env bash

DOMAIN_NAME=$1

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./etc/certs/apache.$DOMAIN_NAME.key \
  -out ./etc/certs/apache.$DOMAIN_NAME.crt \
  -subj "/CN=apache.$DOMAIN_NAME"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./etc/certs/nginx.$DOMAIN_NAME.key \
  -out ./etc/certs/nginx.$DOMAIN_NAME.crt \
  -subj "/CN=nginx.$DOMAIN_NAME"

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout ./etc/certs/$DOMAIN_NAME.key \
  -out ./etc/certs/$DOMAIN_NAME.crt \
  -subj "/CN=$DOMAIN_NAME"
