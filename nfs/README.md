# nfs

## Overview
+ Dependencies
+ Install
+ Usage
+ Documentation

## Dependency
* docker >= 19.*

## Install
```bash
#run container
make start

#
docker-compose exec nfs sh -c "cat /etc/exports"
docker-compose exec nfs sh -c "ls -lah /srv/nfs4"
docker-compose exec nfs sh -c "showmount -e"

PORT=$(make ps|grep nfs_1|awk '{print $4}'|cut -d ':' -f2|cut -d '-' -f1)

docker-compose exec server-alpine sh -c "cat /etc/exports"
docker-compose exec server-alpine sh -c "ls -lah /srv/nfs4"
docker-compose exec server-alpine sh -c "showmount -e"

PORT=$(make ps|grep nfs-alpine_1|awk '{print $4}'|cut -d ':' -f2|cut -d '-' -f1)

sudo mkdir -p $HOME/nfs/data && sudo chmod -R 777 $HOME/nfs
sudo mount -v -t nfs -o vers=4,port=$PORT 127.0.0.1:/data $HOME/nfs/data
sudo touch test $HOME/nfs/data/test
sudo umount $HOME/nfs/data
```

## Usage
```bash
#check container is running
make ps
#check container logs
make logs
```

## Documentation
* [docker][0]

[0]: https://docs.docker.com/get-started/
