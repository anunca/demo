# FrankenPHP
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- docker
  - https://hub.docker.com/_/caddy
  - https://hub.docker.com/r/dunglas/frankenphp
- https://caddyserver.com/docs/caddyfile/options
- https://caddyserver.com/docs/caddyfile/concepts
- https://frankenphp.dev/fr/docs/docker/
## install
```sh
make help
```
## notes
prod
```sh
export ENV=prod
```
```sh
aws configure list
```
```sh
cat <<EOF>> /etc/hosts
127.0.0.1 appdemo.name
127.0.0.1 frankenphp.appdemo.name
EOF
```
redis
```sh
docker exec -it frankenphp-redis-1 redis-cli
```
prompt
```sh
127.0.0.1:6379> KEYS *
127.0.0.1:6379> SET foo bar
127.0.0.1:6379> GET foo
127.0.0.1:6379> KEYS f*
127.0.0.1:6379> FLUSHALL
```
browse app [FrankenPHP](http://frankenphp.appdemo.name)