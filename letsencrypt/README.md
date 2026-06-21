# letsencrypt

## install
```sh
mv etc/nginx/app.conf etc/nginx/app\
&& mv etc/nginx/letsencrypt etc/nginx/letsencrypt.conf\
&& make start
```
```sh
IP="IP"
```
```sh
docker compose exec certbot sh -c "apk add bash curl"\
&& docker compose exec certbot bash sh/init-letsencrypt.sh $IP
```
```sh
mv etc/nginx/app etc/nginx/app.conf\
&& mv etc/nginx/letsencrypt.conf etc/nginx/letsencrypt\
&& make restart
```