ARG NGINX_VERSION=1.30.0
ARG NGINX_IMAGE=nginx:${NGINX_VERSION}-alpine

FROM $NGINX_IMAGE AS dev
COPY src/index-dev.html /usr/share/nginx/html/index.html

FROM $NGINX_IMAGE AS prod
COPY src/index-prod.html /usr/share/nginx/html/index.html
