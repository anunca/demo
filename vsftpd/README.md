# vftpd

## Overview
+ Dependencies
+ Install
+ Usage
+ Documentation

## Dependency
* docker >= 19.*

## Install
```bash
#Create docker image from Dockerfile
make build
#Run container
make start
#Check container is running
make ps
#Get into container
make connect
```

## Usage
```bash
#Add user
make user.add
```

## Documentation
* [docker][0]

[0]: https://docs.docker.com/get-started/