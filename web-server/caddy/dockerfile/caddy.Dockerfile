ARG CADDY_BUILDER_VERSION=caddy:2.9.1-builder-alpine
ARG CADDY_VERSION=caddy:2.9.1-alpine

FROM $CADDY_BUILDER_VERSION AS builder

#Caddy plugin
RUN xcaddy build \
  --with github.com/ueffel/caddy-brotli\
  #AWS Route 53 DNS plugin
  --with github.com/caddy-dns/route53

FROM $CADDY_VERSION AS runner

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

WORKDIR /srv

FROM runner AS dev

FROM runner AS prod

#Caddy conf
COPY etc/caddy/Caddyfile /etc/caddy/Caddyfile

COPY src .
