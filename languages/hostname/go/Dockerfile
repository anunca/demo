ARG GO_VERSION
ARG ALPINE_VERSION

FROM $GO_VERSION AS build

WORKDIR /app

COPY ./src .

RUN go build -o app

FROM $ALPINE_VERSION

WORKDIR /app

COPY --from=build /app/app /app

EXPOSE 80

CMD [ "/app/app" ]
