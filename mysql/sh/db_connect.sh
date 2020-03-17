#!/bin/bash

H=localhost
U=root
P=root
D=db

docker-compose exec db mysql -h$H -u$U -p$P $D