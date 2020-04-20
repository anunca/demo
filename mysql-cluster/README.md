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
#create network
docker network create cluster --subnet=192.168.0.0/16
#run container
make start
|
docker run -d --net=cluster --name=management1 --ip=192.168.0.2 mysql/mysql-cluster ndb_mgmd
docker run -d --net=cluster --name=ndb1 --ip=192.168.0.3 mysql/mysql-cluster ndbd
docker run -d --net=cluster --name=ndb2 --ip=192.168.0.4 mysql/mysql-cluster ndbd
docker run -d --net=cluster --name=mysql1 --ip=192.168.0.10 -e MYSQL_ROOT_PASSWORD=root -p3306:3306 mysql/mysql-cluster mysqld
#grant all user
#<MySQL 8
docker exec -it mysql1 mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"
#>MySQL5.7
docker exec -it mysql1 mysql -uroot -proot -e "CREATE USER 'root'@'%' IDENTIFIED BY 'root'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

docker exec -it mysql1 mysql -uroot -proot -e 'USE mysql; SELECT User,Host FROM user WHERE User="root";'

#check cluster
#MYSQL_VERSION=mysql/mysql-cluster:8.0.19-1.1.15-cluster
MYSQL_VERSION=mysql/mysql-cluster:7.6.13-1.1.15-cluster

docker run -it --net=cluster --rm $MYSQL_VERSION ndb_mgm -e show

docker exec -it management1 ndb_mgm -e show \
&& docker exec -it ndb1 ndb_mgm -e show \
&& docker exec -it ndb2 ndb_mgm -e show \
&& docker exec -it mysql1 ndb_mgm -e show

docker exec -it mysql1 mysql -uroot -proot -e 'SHOW SLAVE STATUS \G;' \
&& docker exec -it mysql1 mysql -uroot -proot -e 'SHOW PROCESSLIST \G;' \
&& docker exec -it mysql1 mysql -uroot -proot -e 'SHOW SLAVE HOSTS \G;' \
&& docker exec -it mysql1 mysql -uroot -proot -e 'SHOW ENGINE NDB STATUS \G;'

docker exec -it management1 bash -c "ls /var/lib/mysql/*" \
&& docker exec -it ndb1 bash -c "ls /var/lib/mysql/*" \
&& docker exec -it ndb2 bash -c "ls /var/lib/mysql/*" \
&& docker exec -it mysql1 bash -c "ls /var/lib/mysql/*"

#
docker exec -it mysql1 mysql -uroot -proot -e 'CREATE DATABASE app'
docker exec -it mysql1 mysql -uroot -proot app -e 'CREATE TABLE app (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL)'
docker exec -it mysql1 mysql -uroot -proot app -e 'DESCRIBE app'
docker exec -it mysql1 mysql -uroot -proot app -e "INSERT INTO app (name) VALUES('my name')"
docker exec -it mysql1 mysql -uroot -proot app -e "SELECT * FROM app"
docker exec -it mysql1 mysql -uroot -proot app -e "SELECT COUNT(*) FROM app"
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
* [docker hub mysql cluster][1]
* [github mysql cluster][2]

[0]: https://docs.docker.com/get-started/
[1]: https://hub.docker.com/r/mysql/mysql-cluster/
[2]: https://github.com/mysql/mysql-docker/tree/mysql-cluster