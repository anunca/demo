ARG NODE_IMAGE=node:26.1.0-alpine

FROM $NODE_IMAGE

WORKDIR /app

COPY ./src .

RUN npm i --omit=dev

EXPOSE 80

CMD [ "yarn", "start" ]
