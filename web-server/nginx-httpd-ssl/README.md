# nginx and Apache SSL
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://nginx.org/
## install
```sh
make help
```
## notes
create self signed crt and key for DOMAIN_NAME_SSL
```sh
make certs\
&& sudo make certs.macOS.create\
&& make stop build start
```
```sh
cat <<EOF >> /etc/hosts
127.0.0.1 app.com
127.0.0.1 www.app.com
127.0.0.1 backoffice.app.com
EOF
```
