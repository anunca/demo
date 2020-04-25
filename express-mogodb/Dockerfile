ARG NODE_VERSION

FROM $NODE_VERSION as dev

WORKDIR /app

CMD yarn install && yarn start:dev

FROM dev as prod

COPY src .

RUN yarn install --production

CMD yarn start
