ARG PHP_IMAGE

FROM $PHP_IMAGE

WORKDIR /app

COPY ./src .

EXPOSE 80

CMD [ "-S", "0.0.0.0:80", "app.php" ]
