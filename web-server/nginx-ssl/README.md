# nginx SSL
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://nginx.org
- https://connect.ed-diamond.com/Linux-Pratique/lp-123/les-certificats-de-l-emission-a-la-revocation
## install
```sh
make help
```
## notes
config
```sh
cat <<EOF | sudo tee -a /etc/hosts > /dev/null
127.0.0.1 appdemo.name
127.0.0.1 app.appdemo.name
EOF
```
build
```sh
make ssc.create
```
load CA
- Linux
    - Debian like
    ```sh
    cp etc/nginx/ssl/app.appdemo.name.crt /usr/local/share/ca-certificates/
    update-ca-certificates
    ```
    - RedHat like
    ```sh
    cp etc/nginx/ssl/CA-app.appdemo.name.pem /etc/pki/ca-trust/source/anchors/
    update-ca-trust
    ```
- macOS
    ```sh
    make ssc.macOS.add
    ```
browse [app](http://app.appdemo.name)
