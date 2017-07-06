FROM alpine:3.6 as builder

WORKDIR /tmp
RUN apk add --update alpine-sdk &&\
    wget https://github.com/grobian/carbon-c-relay/releases/download/v3.1/carbon-c-relay-3.1.tar.gz &&\
    tar vxf carbon-c-relay-3.1.tar.gz &&\
    cd carbon-c-relay-3.1 &&\
    ls -1 &&\
    ./configure &&\
    make &&\
    mv relay /carbon-c-relay


FROM alpine:3.6
COPY --from=builder /carbon-c-relay /usr/sbin/carbon-c-relay

RUN apk add --update --no-cache openssl tini

RUN mkdir /etc/carbon-c-relay &&\
    chmod 755 /usr/sbin/carbon-c-relay && \
    adduser -D -g carbon-c-relay carbon-c-relay && \
    sed -ie 's/^root::/root:!:/' /etc/shadow


ADD conf/* /etc/carbon-c-relay/

ENTRYPOINT ["tini", "--"]

CMD [ "/usr/sbin/carbon-c-relay", "-f", "/etc/carbon-c-relay/carbon-c-relay.conf", "-p", "2411", "-w", "8", "-b", "5000", "-q", "12500000", "-S", "60", "-H", "carbon-c-relay" ]

EXPOSE 2411

USER carbon-c-relay