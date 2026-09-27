ARG NGINX_IMAGE=nginx:1.27.2-alpine

FROM $NGINX_IMAGE AS dev

COPY --from=register.app.internal/docker-buildx/base:dev /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html

FROM $NGINX_IMAGE AS prod

COPY --from=register.app.internal/docker-buildx/base:prod /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html
