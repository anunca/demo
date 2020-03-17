# mysql-cluster

## Overview
+ Dependencies
+ Install
+ Usage
+ Documentation

## Dependency
* docker >= 19.*

## Install
```bash
#Run container
make start
#Check container is running
make ps
```

## Usage
```bash
docker network create cluster --subnet=172.20.1.0/16
```

## Documentation
* [docker][0]

[0]: https://docs.docker.com/get-started/