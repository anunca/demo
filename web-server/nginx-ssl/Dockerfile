ARG NGINX_IMAGE=nginx:alpine
FROM $NGINX_IMAGE

ARG APP_DOMAIN_NAME=www.appdemo.name
ENV APP_DOMAIN_NAME=$APP_DOMAIN_NAME

COPY etc/nginx/conf.d/_default.conf /etc/nginx/templates/_default.conf.template
COPY etc/nginx/html/default.html /usr/share/nginx/html/default.html
COPY etc/nginx/conf.d/app.conf /etc/nginx/templates/app.conf.template
COPY etc/nginx/ssl /etc/nginx/ssl

EXPOSE 80 443
