FROM alpine:3.6


RUN apk add --update --no-cache openssl tini
RUN wget https://github.com/lomik/go-carbon/releases/download/v0.10.1/go-carbon-linux-amd64
RUN mkdir -p /var/lib/graphite/whisper/ /var/lib/graphite/dump/ /etc/go-carbon/
RUN mv go-carbon-linux-amd64 /usr/sbin/go-carbon
RUN chmod 755 /usr/sbin/go-carbon
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN adduser -D -g go-carbon go-carbon && \
    sed -ie 's/^root::/root:!:/' /etc/shadow && \
    chown -R go-carbon:go-carbon /var/lib/graphite


ADD conf/* /etc/go-carbon/

ENTRYPOINT ["tini", "--"]

CMD ["/usr/sbin/go-carbon", "-config", "/etc/go-carbon/go-carbon.conf"]

EXPOSE 2003 2003/udp 2004 7002 7007 8090
VOLUME /var/lib/graphite
USER go-carbon