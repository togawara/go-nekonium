FROM alpine:3.5

ADD . /go-ethereum
RUN \
  apk add --update git go make gcc musl-dev linux-headers && \
  (cd go-ethereum && make geth)                           && \
  cp go-ethereum/build/bin/geth /usr/local/bin/           && \
  apk del git go make gcc musl-dev linux-headers          && \
  rm -rf /go-ethereum && rm -rf /var/cache/apk/*

EXPOSE 8293
EXPOSE 28568
EXPOSE 28568/udp

ENTRYPOINT ["geth"]
