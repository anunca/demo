# mysql-replication-cluster

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
docker-compose exec master bash -c "ls /bitnami/mysql/data/*" \
&& docker-compose exec slave bash -c "ls /bitnami/mysql/data/*"

#
docker-compose exec master mysql -uroot -proot -e 'CREATE DATABASE app2'
docker-compose exec master mysql -uroot -proot app2 -e 'CREATE TABLE app (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL)'
docker-compose exec master mysql -uroot -proot app2 -e 'DESCRIBE app'

#
docker-compose exec master mysql -uroot -proot -e "GRANT INSERT, SELECT, UPDATE, DELETE ON app2.* TO 'master'@'%'; FLUSH PRIVILEGES;"
docker-compose exec slave mysql -uroot -proot -e "GRANT SELECT ON app2.* TO 'slave'@'%'; FLUSH PRIVILEGES;"

#
docker-compose exec master mysql -umaster -pmaster app2 -e "INSERT INTO app (name) VALUES('my name')"
docker-compose exec master mysql -uslave -pslave app2 -e "SELECT * FROM app"
docker-compose exec master mysql -uslave -pslave app2 -e "SELECT COUNT(*) FROM app"

#
docker-compose exec master mysql -uroot -proot -e 'DROP DATABASE app2'

#scale the number of slaves
docker-compose up --detach --scale master=1 --scale slave=4

for SLAVE in $(docker ps -a|tail -n5|head -n4|awk '{print $11}'); do docker exec -it "$SLAVE" mysql -uroot -proot -e "GRANT SELECT ON app2.* TO 'slave'@'%'; FLUSH PRIVILEGES;"; done
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
* [docker hub mysql replication cluster][1]
* [github mysql replication cluster][2]

[0]: https://docs.docker.com/get-started/
[1]: hhttps://hub.docker.com/r/bitnami/mysql/
[2]: https://github.com/bitnami/bitnami-docker-mysql