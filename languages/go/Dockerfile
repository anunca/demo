ARG GO_VERSION=golang:1.26.3-alpine

FROM $GO_VERSION AS dev

WORKDIR /app

ENTRYPOINT [ "go", "run" ]
CMD [ "app.go", "TODO" ]
