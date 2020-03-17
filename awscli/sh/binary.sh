#!/usr/bin/env sh

docker run --network host --rm \
    -v $HOME/.aws:/root/.aws \
    anunca/demo-awscli "$@"