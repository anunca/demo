ARG NGINX_IMAGE=nginx:1.31.4-alpine

FROM $NGINX_IMAGE AS dev
COPY src/index-dev.html /usr/share/nginx/html/index.html

FROM $NGINX_IMAGE AS prod
COPY src/index-prod.html /usr/share/nginx/html/index.html
