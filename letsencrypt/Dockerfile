ARG PHP_IMAGE=php:8.5.9-alpine

FROM $PHP_IMAGE AS base

RUN echo "<?php\nphpinfo();\n" > /var/www/html/index.php
