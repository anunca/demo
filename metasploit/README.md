# metasploit

## install
```sh
docker-compose build
docker-compose push
docker-compose pull
docker-compose up -d
```

## config
```sh
docker-compose exec app

msfdb init
```

## use
```sh
sudo msfconsole
db_connect root:root@db/db
db_status
workspace
db_nmap -sS -A host
```
