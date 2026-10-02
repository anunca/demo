ARG COMPOSER_IMAGE=composer:2.10.2
ARG PHP_IMAGE=php:8.5.10-cli-alpine

FROM $COMPOSER_IMAGE AS composer

FROM $PHP_IMAGE AS base

WORKDIR /app

FROM base AS base-builder

#Composer dependencies
RUN apk add --no-cache git unzip

COPY --from=composer /usr/bin/composer /usr/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

FROM base-builder AS dev

COPY src/composer.json src/composer.lock ./
RUN --mount=type=cache,target=/tmp/composer-cache \
  COMPOSER_CACHE_DIR=/tmp/composer-cache composer install
COPY src .

FROM base-builder AS prod-builder

COPY src/composer.json src/composer.lock ./
RUN --mount=type=cache,target=/tmp/composer-cache \
  COMPOSER_CACHE_DIR=/tmp/composer-cache composer install --no-dev --no-interaction --no-progress --prefer-dist --no-autoloader --no-scripts
COPY src .
# Generate the optimized autoloader after application classes are available.
RUN composer dump-autoload --no-dev --optimize --no-interaction

FROM base AS prod

COPY --from=prod-builder /app .
