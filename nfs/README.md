# NFS
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://ubuntu.com/server/docs/service-nfs
## install
```sh
make start
```
## notes
```sh
docker compose exec nfs sh -c "cat /etc/exports"
```
```sh
docker compose exec nfs sh -c "ls -lah /srv/nfs4"
```
```sh
docker compose exec nfs sh -c "showmount -e"
```
```sh
mkdir -p $HOME/nfs/data/test\
&& chmod -R 777 $HOME/nfs
```
```sh
PORT=$(make ps|grep nfs_1|awk '{print $4}'|cut -d ':' -f2|cut -d '-' -f1)
```
```sh
sudo mount -v -t nfs -o vers=4,port=$PORT 127.0.0.1:/srv/nfs4/data $HOME/nfs/data
```
```sh
sudo umount $HOME/nfs/data
```