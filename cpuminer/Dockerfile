FROM ubuntu:18.04

RUN apt update -qq && \
    apt install -qqy automake autoconf pkg-config libcurl4-openssl-dev libssl-dev libjansson-dev libgmp-dev make g++ git

RUN git clone https://github.com/tpruvot/cpuminer-multi -b linux

WORKDIR /cpuminer-multi

RUN ./build.sh

ENTRYPOINT ["./minerd"]
