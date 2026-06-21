# Centos, Fedora
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://fedoraproject.org
- https://www.centos.org
## install
```sh
make help
```
## notes
Create docker image from base
```sh
cd base && make build && cd ..
```
Create docker image
```sh
make build
```
Run container
```sh
make start
```
Check container is running
```sh
make ps
```
Get into container
```sh
make sh.master1
make sh.node1
```
Add multipass
```sh
make multipass.install
```
TODO check this
```sh
make multipass.launch
```