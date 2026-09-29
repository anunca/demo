ARG RUST_IMAGE=rust:1.98.0-alpine

FROM $RUST_IMAGE AS base

WORKDIR /app

FROM base AS dev

COPY src .

CMD [ "cargo", "run" ]

FROM base AS prod

COPY src .

CMD [ "cargo", "run", "-r" ]
