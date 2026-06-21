ARG BUSYBOX_IMAGE=busybox:1.37.0

FROM $BUSYBOX_IMAGE AS base

WORKDIR /usr/share/nginx/html

FROM base AS dev
COPY src/index-dev.html index.html

FROM base AS prod
COPY src/index-prod.html index.html
