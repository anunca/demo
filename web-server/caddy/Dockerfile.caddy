ARG CADDY_BUILDER_IMAGE=caddy:2.11.4-builder-alpine
ARG CADDY_IMAGE=caddy:2.11.4-alpine

FROM $CADDY_BUILDER_IMAGE AS builder

#Caddy plugin
RUN xcaddy build \
  --with github.com/ueffel/caddy-brotli\
  #AWS Route 53 DNS plugin
  --with github.com/caddy-dns/route53

FROM $CADDY_IMAGE AS runner

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

WORKDIR /srv

FROM runner AS dev

FROM runner AS prod

#Caddy conf
COPY etc/caddy/Caddyfile /etc/caddy/Caddyfile

COPY src .
