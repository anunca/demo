ARG PHP_IMAGE=php:8.5.10-fpm-alpine

FROM $PHP_IMAGE AS base

WORKDIR /srv

FROM base AS dev

#php conf
RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

FROM base AS prod

#php conf
RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

#php-fpm conf
COPY etc/php/php-fpm.conf $($PHP_INI_DIR}-fpm.d/zz-docker.conf

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

COPY src .
