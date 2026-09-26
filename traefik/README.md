# Traefik
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://traefik.io/traefik
## install
```sh
make help
```
## notes
check
```sh
bash sh/cert_check.sh localhost
```
check with curl
```sh
curl -v -H'Host: nginx.localhost' https://localhost --cacert ./etc/certs/nginx.localhost.crt
```