ARG COMPOSER_IMAGE=composer:2.9.7
ARG FRANKENPHP_BUILDER_IMAGE
ARG FRANKENPHP_IMAGE

FROM $COMPOSER_IMAGE AS composer

#frankenphp builder
FROM $FRANKENPHP_BUILDER_IMAGE AS builder

COPY --from=caddy:builder /usr/bin/xcaddy /usr/bin/xcaddy

# CGO must be enabled to build FrankenPHP
RUN CGO_ENABLED=1 \
    XCADDY_SETCAP=1 \
    XCADDY_GO_BUILD_FLAGS="-ldflags='-w -s' -tags=nobadger,nomysql,nopgx" \
    CGO_CFLAGS=$(php-config --includes) \
    CGO_LDFLAGS="$(php-config --ldflags) $(php-config --libs)" \
    xcaddy build \
    --output /usr/local/bin/frankenphp \
    --with github.com/dunglas/frankenphp=./ \
    --with github.com/dunglas/frankenphp/caddy=./caddy/ \
    --with github.com/dunglas/caddy-cbrotli
    # --with github.com/dunglas/mercure/caddy \
    # --with github.com/dunglas/vulcain/caddy \
    #TODO find out why is it not building
    #AWS Route 53 DNS plugin
    # --with github.com/caddy-dns/route53

FROM $FRANKENPHP_IMAGE AS base

COPY --from=builder /usr/local/bin/frankenphp /usr/local/bin/frankenphp

#php extensions
RUN install-php-extensions\
  redis\
  opcache

WORKDIR /app

FROM base AS base-builder

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

FROM base-builder AS dev

#php conf
RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

FROM base-builder AS builder-prod

COPY src/composer.json .

RUN composer install --no-dev --optimize-autoloader

COPY src .

FROM base AS prod

#Caddy conf
COPY etc/caddy/Caddyfile /etc/caddy/Caddyfile

#php conf
RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

#php opcache
COPY <<EOF $PHP_INI_DIR/conf.d/docker-php-ext-opcache.ini
zend_extension=opcache
[opcache]
opcache.enable=1
opcache.enable_cli=1
opcache.memory_consumption=256
opcache.interned_strings_buffer=16
opcache.max_accelerated_files=20000
opcache.validate_timestamps=0
opcache.jit_buffer_size=100M
EOF

COPY --from=builder-prod --chown=www-data:www-data /app .

# TODO check why i cannot use another user than root
# USER www-data
