# metasploit

## install
```sh
make build
make push
make pull
make start
```

## config
```sh
make shell

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
