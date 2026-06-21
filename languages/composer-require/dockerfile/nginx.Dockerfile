ARG NGINX_IMAGE=nginx:1.27.2-alpine-slim

FROM $NGINX_IMAGE AS base

WORKDIR /usr/share/nginx/html

FROM base AS dev

COPY etc/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY src/index.php .

FROM base AS prod

COPY etc/nginx/default.conf /etc/nginx/conf.d/default.conf

COPY src/index.php .
