# centos-fedora

## Overview
+ Dependencies
+ Install
+ Usage
+ Documentation

## Dependency
* docker >= 19.*

## Install
```bash
#Create docker image from base
cd base && make build && cd ..
#Create docker image
make build
#Run container
make start
#Check container is running
make ps
#Get into container
make shell.master1
make shell.node1
```

## Usage
```bash
#Add multipass
#TODO check this
make multipass.install
make multipass.launch
```

## Documentation
* [docker][0]

[0]: https://docs.docker.com/get-started/
