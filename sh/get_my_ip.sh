#!/bin/bash

IP=`curl -sS ipecho.net/plain`
echo -e "Ip: $IP from ipecho.net/plain\n"

IP=`curl -sS ifconfig.me`
echo -e "Ip: $IP from ifconfig.me\n"