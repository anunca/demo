ARG HTTPD_MOD_PHP=php:8.3.30-apache

FROM $HTTPD_MOD_PHP AS base

#php gd
RUN <<EOF
apt update && apt install -y libfreetype-dev libjpeg62-turbo-dev libpng-dev
rm -rf /var/lib/apt/lists/*
docker-php-ext-configure gd --with-freetype --with-jpeg
docker-php-ext-install -j$(nproc) gd
EOF

#php redis
RUN <<EOF
pecl install redis
docker-php-ext-enable redis
EOF

#apache
RUN <<EOF
rm /etc/apache2/mods-enabled/access_compat*
#Alias
# rm /etc/apache2/mods-enabled/alias*
rm /etc/apache2/mods-enabled/auth_basic*
rm /etc/apache2/mods-enabled/authn_core*
rm /etc/apache2/mods-enabled/authn_file*
#Require
# rm /etc/apache2/mods-enabled/authz_core*
rm /etc/apache2/mods-enabled/authz_host*
rm /etc/apache2/mods-enabled/authz_user*
rm /etc/apache2/mods-enabled/autoindex*
# rm /etc/apache2/mods-enabled/deflate*
#DirectoryIndex
# rm /etc/apache2/mods-enabled/dir*
#SetEnv
# rm /etc/apache2/mods-enabled/env*
rm /etc/apache2/mods-enabled/filter*
rm /etc/apache2/mods-enabled/mime*
#MPM
# rm /etc/apache2/mods-enabled/mpm_prefork*
rm /etc/apache2/mods-enabled/negotiation*
#PHP
# rm /etc/apache2/mods-enabled/php*
rm /etc/apache2/mods-enabled/reqtimeout*
rm /etc/apache2/mods-enabled/setenvif*
rm /etc/apache2/mods-enabled/status*
EOF

FROM base AS dev

#php xdebug
RUN <<EOF
pecl install xdebug
docker-php-ext-enable xdebug
EOF

#php conf
RUN cp "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

FROM base AS prod

#php conf
RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

#apache conf
COPY etc/apache2/apache2.conf /etc/apache2/apache2.conf
COPY etc/apache2/prod/000-default.conf /etc/apache2/sites-available/000-default.conf

USER www-data

COPY src /var/www/html
