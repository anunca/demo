# HAProxy
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://www.haproxy.org
## install
```sh
make help
```
## notes
```sh
sed '
s/###WORKER_IP1###/10.0.0.1/g;
s/###WORKER_IP2###/10.0.0.2/g;
' etc/haproxy.cfg.template > etc/haproxy.cfg
```