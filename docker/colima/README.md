# Docker Colima
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://brew.sh
- https://github.com/abiosoft/colima/
- https://linuxcontainers.org/incus/docs/main/installing/#installing
## install
```sh
brew install docker docker-compose
```
```sh
brew install colima
```
## notes
runtime
- default runtime Docker
```sh
colima start --vm-type=vz --cpu 8 --memory 8
```
- use Incus
```sh
brew install incus
```
```sh
colima start --vm-type=vz --cpu 8 --memory 8 --runtime incus
```