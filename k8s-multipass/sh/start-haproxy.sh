#!/bin/sh

cd lb/ \
&& docker-compose config \
&& docker-compose build \
&& docker run -it --rm -v$PWD/haproxy/haproxy.cfg:/haproxy.cfg anunca/haproxy -c -f /haproxy.cfg \
&& docker-compose push \
&& docker-compose up -d