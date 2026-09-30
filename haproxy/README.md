# HAProxy
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://www.haproxy.org/
  - https://www.haproxy.com/documentation/haproxy-configuration-tutorials/load-balancing/http/
  - https://www.haproxy.com/documentation/haproxy-configuration-tutorials/network-performance/caching/
- https://nginx.org/en/
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
make ssc.create
```
```sh
cat <<EOF | sudo tee -a /etc/hosts
127.0.0.1 appdemo.name
127.0.0.1 haproxy.appdemo.name
EOF
```
browse apps
- [HAProxy](http://haproxy.appdemo.name)
- [HAProxy stats](http://localhost:8080/haproxy?stats)