ARG NODE_VERSION

FROM $NODE_VERSION

WORKDIR /app

ADD ./src .

RUN yarn install --production

EXPOSE 80

CMD [ "yarn", "start" ]
