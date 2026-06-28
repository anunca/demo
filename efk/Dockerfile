ARG PHP_IMAGE

FROM $PHP_IMAGE AS base
 
#base dependencies
RUN apt update -qq\
  && apt install -y libzip-dev\
  && rm -rf /var/lib/apt/lists/*

#PHP extensions
RUN docker-php-ext-install -j$(nproc) zip pdo_mysql\
  && docker-php-ext-enable opcache
 
WORKDIR /var/www/html
