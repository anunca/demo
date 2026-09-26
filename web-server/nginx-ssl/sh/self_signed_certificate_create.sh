#!/usr/bin/env bash

if [[ -z $1 ]]
then
    exit
else
    APP_DOMAIN_NAME=$1
fi

ETC_NGINX_SSL_DIR=etc/nginx/ssl
CA_FILE=$ETC_NGINX_SSL_DIR/CA-$APP_DOMAIN_NAME
SSC_FILE=$ETC_NGINX_SSL_DIR/$APP_DOMAIN_NAME
COMMON_NAME=$APP_DOMAIN_NAME
SUBJECT="/C=FR/ST=Ile-de-France/L=Paris/O=MyCompany/OU=MyOrganizationUnit/CN=${COMMON_NAME}"

rm -rf $ETC_NGINX_SSL_DIR/*

#CA
openssl genrsa -out $CA_FILE.key 2048
openssl req -x509 -new -nodes -key $CA_FILE.key -sha256 -days 365 -subj "$SUBJECT" -out $CA_FILE.pem
# openssl genrsa -out CA-key.pem 4096
# openssl req -new -key CA-key.pem -x509 -days 1000 -out CA-cert.pem

#SSC
openssl req -new -newkey rsa:2048 -sha256 -nodes -keyout $SSC_FILE.key -subj "$SUBJECT" -out $SSC_FILE.csr
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "${SUBJECT}" -out etc/nginx/ssl/${APP_DOMAIN_NAME}.crt -keyout etc/nginx/ssl/${APP_DOMAIN_NAME}.key
# openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes

cat <<EOF > $SSC_FILE.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = $APP_DOMAIN_NAME
EOF

#SSC
openssl x509 -req -in $SSC_FILE.csr -CA $CA_FILE.pem -CAkey $CA_FILE.key -CAcreateserial -out $SSC_FILE.crt -days 365 -sha256 -extfile $SSC_FILE.ext
# openssl x509 -req -days 365 -in ../csr/www-cert.csr -CA ../CA-cert.pem -CAkey ../CA-key.pem -CAcreateserial -out www-cert.pem