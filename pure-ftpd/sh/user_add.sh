#!/bin/bash

# docker-compose exec pure-ftpd mkdir /home/ftp/$USERNAME
echo docker-compose exec pure-ftpd pure-pw useradd $USERNAME -u ftpuser -g ftpgroup -d /home/ftp/$USERNAME
docker-compose exec pure-ftpd pure-pw mkdb
docker-compose exec pure-ftpd ln -s /etc/pure-ftpd/conf/PureDB /etc/pure-ftpd/auth/50pure