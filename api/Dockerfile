ARG NODE_VERSION

FROM $NODE_VERSION

WORKDIR /app

RUN yarn global add serverless\
    && yarn install

CMD sls offline start