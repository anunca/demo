#!/usr/bin/env bash

DOMAIN_NAME=$1
FILE_CA=certs/ca.$DOMAIN_NAME
FILE=certs/$DOMAIN_NAME
COMMON_NAME=${2:-*.$DOMAIN_NAME}
SUBJECT="/C=FR/ST=Ile-de-France/L=Paris/O=O/OU=OU/CN=$COMMON_NAME"
DAYS=3650

rm -rf certs/*

#CA
openssl genrsa -out $FILE_CA.key 2048
openssl req -x509 -new -nodes -key $FILE_CA.key -sha256 -days $DAYS -subj "$SUBJECT" -out $FILE_CA.pem

#CA SS
openssl req -new -newkey rsa:2048 -sha256 -nodes -keyout $FILE.key -subj "$SUBJECT" -out $FILE.csr

cat <<EOF > $FILE.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = $DOMAIN_NAME
DNS.2 = www.$DOMAIN_NAME
DNS.3 = backoffice.$DOMAIN_NAME
EOF

openssl x509 -req -in $FILE.csr -CA $FILE_CA.pem -CAkey $FILE_CA.key -CAcreateserial -out $FILE.crt -days $DAYS -sha256 -extfile $FILE.ext

openssl verify -CAfile $FILE_CA.pem -verbose $FILE.crt
