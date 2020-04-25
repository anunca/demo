ARG PHP_VERSION

FROM $PHP_VERSION AS phpBase

RUN docker-php-ext-enable opcache

WORKDIR /var/www/html

#dev
FROM phpBase AS dev

COPY --from=composer /usr/bin/composer /usr/local/bin/composer
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN apt-get update\
  && apt-get install -y unzip git\
  && rm -rf /var/lib/apt/lists/*

COPY src .

RUN composer install

#build
FROM dev AS build

COPY src .

RUN composer install --optimize-autoloader\
  && composer dump-autoload --optimize --classmap-authoritative

#prod
FROM phpBase as prod

COPY --from=build /var/www/html .