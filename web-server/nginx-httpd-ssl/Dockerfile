ARG NGINX_VERSION=nginx:1.31.4-alpine
FROM $NGINX_VERSION

ARG DOMAIN_NAME

RUN mkdir /etc/nginx/ssl\
  && chown -R nginx:nginx /etc/nginx/ssl/
COPY certs/${DOMAIN_NAME}.key /etc/nginx/ssl/${DOMAIN_NAME}.key
COPY certs/${DOMAIN_NAME}.crt /etc/nginx/ssl/${DOMAIN_NAME}.crt

COPY /etc/nginx.conf /etc/nginx/nginx.conf
RUN sed -i "s/###DOMAIN_NAME###/${DOMAIN_NAME}/g" /etc/nginx/nginx.conf
COPY /etc/proxy_params /etc/nginx/proxy_params

# HEALTHCHECK --interval=10s --timeout=3s CMD curl --fail http://localhost/health || exit 1
