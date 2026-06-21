ARG ALPINE_VERSION

FROM $ALPINE_VERSION

WORKDIR /app

RUN apk --no-cache add nmap

ENTRYPOINT [ "nmap" ]

CMD [ "-V" ]
