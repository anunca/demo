#!/usr/bin/env bash

IP="$1"

if [[ ! -z "$IP" ]]
then
  echo "IP $IP is misssing"
  exit
fi

domains=($IP)
rsa_key_size=4096
certbot_path="/var/www/certbot"
letsencrypt_path="/etc/letsencrypt"
letsencrypt_live_domains_path="$letsencrypt_path/live/$domains"
staging=0
email=""


if [[ -d "$certbot_path" ]]
then
  read -p "Existing data found for $domains. Continue and replace existing certificate? (y/N) " decision
  if [[ "$decision" != "Y" ]] || [[ "$decision" != "y" ]]
  then
    exit
  fi
fi

if [[ ! -e "$certbot_path/conf/options-ssl-nginx.conf" ]] && [[ ! -e "$certbot_path/conf/ssl-dhparams.pem" ]]
then
  echo "Downloading recommended TLS parameters ..."
  mkdir -p "$certbot_path/conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf > "$certbot_path/conf/options-ssl-nginx.conf"
  curl -s https://raw.githubusercontent.com/certbot/certbot/master/certbot/certbot/ssl-dhparams.pem > "$certbot_path/conf/ssl-dhparams.pem"
fi


echo "Creating dummy certificate for $domains ..."
mkdir -p "$certbot_path/conf/live/$domains"
openssl req -x509 -nodes -newkey rsa:1024 -days 1\
  -keyout "$letsencrypt_live_domains_path/privkey.pem"\
  -out "$letsencrypt_live_domains_path/fullchain.pem"\
  -subj '/CN=localhost'

echo "Deleting dummy certificate for $domains ..."
rm -rf $letsencrypt_live_domains_path\
&& rm -rf $letsencrypt_path/archive/$domains\
&& rm -rf $letsencrypt_path/renewal/$domains.conf

# Enable staging mode if needed
if [[ $staging != "0" ]]
then
  staging_arg="--staging"
fi

# Select appropriate email arg
case "$email" in
  "") email_arg="--register-unsafely-without-email" ;;
  *) email_arg="--email $email" ;;
esac

# Join $domains to -d args
domain_args=""
for domain in "${domains[@]}"
do
  domain_args="$domain_args -d $domain"
done

echo "Requesting Let\'s Encrypt certificate for $domains ..."
certbot certonly --webroot -w "$certbot_path"\
  $staging_arg\
  $email_arg\
  $domain_args\
  --rsa-key-size $rsa_key_size\
  --agree-tos\
  --force-renewal