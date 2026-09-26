#!/usr/bin/env bash

DOMAIN_NAME=$1

openssl x509 -in ./etc/certs/apache.$DOMAIN_NAME.crt -text -noout
openssl x509 -in ./etc/certs/nginx.$DOMAIN_NAME.crt -text -noout
openssl x509 -in ./etc/certs/$DOMAIN_NAME.crt -text -noout
