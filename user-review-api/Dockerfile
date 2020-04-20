ARG NODE_VERSION

FROM $NODE_VERSION

RUN yarn global add serverless

WORKDIR /app

COPY src/package.json .

RUN yarn install --silent

CMD sls -s dev offline start --watch