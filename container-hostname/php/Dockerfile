ARG PHP_VERSION

FROM $PHP_VERSION

WORKDIR /app

ADD ./src .

EXPOSE 80

CMD [ "-S", "0.0.0.0:80", "app.php" ]