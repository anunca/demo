# Caddy
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://caddyserver.com/docs/caddyfile
- https://caddyserver.com/docs/modules/
- https://github.com/caddy-dns/route53
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
cat <<EOF | sudo tee -a /etc/hosts > /dev/null
127.0.0.1 appdemo.name
127.0.0.1 caddy.appdemo.name
EOF
```
browse app [Caddy](http://caddy.appdemo.name)