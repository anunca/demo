ARG ALPINE_IMAGE=alpine:3.24.1

FROM $ALPINE_IMAGE

WORKDIR /app

RUN apk --no-cache add nmap

ENTRYPOINT [ "nmap" ]

CMD [ "-V" ]
