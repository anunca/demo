ARG NODE_VERSION

FROM $NODE_VERSION

WORKDIR /app

RUN yarn global add serverless

COPY src/package.json .
COPY src/yarn.lock .

RUN yarn install

CMD sls offline start --watch