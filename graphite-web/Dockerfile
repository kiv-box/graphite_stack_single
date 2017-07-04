FROM alpine:3.6

LABEL name="graphite-web"
LABEL version="1.0.1"
LABEL description="graphite-web container"

ENV GRAPHITE_ROOT /opt/graphite

RUN apk add --update-cache \
        ca-certificates \
        libffi-dev \
        py2-pip \
        py-twisted \
        py2-cairo \
        py-gunicorn \
        supervisor \
        nginx \
    && pip --no-cache-dir install --upgrade pip \
    && pip --no-cache-dir install \
        carbon \
        django \
        django-tagging \
        gunicorn \
        pyparsing \
        pytz \
        whisper \
        python-memcached \
    && pip --no-cache-dir install https://github.com/graphite-project/ceres/tarball/master \
    && apk add --virtual=build-deps \
        gcc \
        python-dev \
        musl-dev \
    && pip install scandir \
    && pip install graphite-web==1.0.1 \
    && apk del build-deps \
    && rm -rf /var/cache/apk/*

ADD docker/initial_data.json /opt/graphite/webapp/graphite/initial_data.json
ADD docker/docker-entrypoint.sh /docker-entrypoint.sh
ADD docker/nginx.conf /etc/nginx/nginx.conf
ADD docker/supervisord.conf /etc/supervisord.conf

RUN adduser -D -g graphte-web graphte-web \
    && sed -ie 's/^root::/root:!:/' /etc/shadow \
    && chown root:root /docker-entrypoint.sh /etc/nginx/nginx.conf /etc/supervisord.conf \
    && chmod 755 /docker-entrypoint.sh /etc/nginx/nginx.conf /etc//supervisord.conf \
    && mkdir -p /opt/graphite/static \
    && chown -Rv graphte-web:graphte-web /var/log/nginx \
                 /opt/graphite/static \
                 /opt/graphite/storage \
                 /opt/graphite/conf \
                 /opt/graphite/webapp/graphite \
                 /var/tmp/nginx \
                 /var/lib/nginx

USER graphte-web

EXPOSE 8080

VOLUME [ "/opt/graphite/conf", "/opt/graphite/storage" ]

WORKDIR /opt/graphite/webapp
ENTRYPOINT [ "/docker-entrypoint.sh" ]
