# Certbot
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://eff-certbot.readthedocs.io/en/latest/install.html#alternative-1-docker
## install
```sh
make help
```
## notes
```sh
aws configure list
```
```sh
cat <<'EOF'> .env
SERVER_NAME=appdemo.name
DOMAINS=${SERVER_NAME},*.${SERVER_NAME}
EMAIL=
EOF
```
```sh
cat <<EOF | sudo tee -a /etc/hosts > /dev/null
127.0.0.1 appdemo.name
127.0.0.1 www.appdemo.name
EOF
```
- certificates
    - create
    ```sh
    make run.certbot
    ```
    - check ./etc/letsencrypt/live
- browse
    - [appdemo](http://appdemo.name)
    - [www appdemo](http://www.appdemo.name)