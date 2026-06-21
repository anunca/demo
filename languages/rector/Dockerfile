ARG COMPOSER_IMAGE=composer:2.9.7
ARG PHP_IMAGE=php:8.2.31-apache

FROM $COMPOSER_IMAGE AS composer

FROM $PHP_IMAGE AS base

#base dependencies
RUN apt update -qq\
  && apt install -y libzip-dev\
  && rm -rf /var/lib/apt/lists/*

#extensions
RUN docker-php-ext-install -j$(nproc) zip\
  && docker-php-ext-enable opcache

WORKDIR /app

FROM base AS dev

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

# COPY src/composer.json .

# RUN composer install

RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

FROM base AS prod

COPY ./src .

RUN composer install --no-dev --optimize-autoloader\
  && composer dump-autoload --no-dev --classmap-authoritative

RUN cp $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini
