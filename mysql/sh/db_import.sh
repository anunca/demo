#!/bin/bash

H=localhost
U=root
P=root
D=db

if [ ! -d $D ];
then
    echo "Directory: $D not found!"
    exit
fi

cd $D

if ls *.dump.gz 1> /dev/null 2>&1;
then
    echo "Dump found"
else
    echo "Dump not found!"
    exit
fi

for T in `ls *.dump.gz`;
do
    echo "Backing up: $T"
    gunzip -c $T | docker-compose exec -T db mysql -h$H -u$U -p$P $D
done;