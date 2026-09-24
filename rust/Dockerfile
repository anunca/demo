ARG RUST_IMAGE=rust:1.98.0-alpine

FROM $RUST_IMAGE AS base

WORKDIR /app

FROM base AS dev

CMD [ "cargo"]

FROM dev AS build


FROM base AS prod

CMD [ "cargo", "-r" ]
