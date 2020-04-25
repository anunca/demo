ARG NODE_VERSION

FROM $NODE_VERSION

RUN yarn global add serverless

WORKDIR /app

COPY src/package.json .
COPY src/yarn.lock .

RUN yarn install --silent

CMD sls offline start --watch
