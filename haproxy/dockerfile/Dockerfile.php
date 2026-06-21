ARG PHP_IMAGE

FROM $PHP_IMAGE AS base

WORKDIR /usr/share/nginx/html

FROM base AS dev

FROM base AS prod

COPY src /usr/share/nginx/html
