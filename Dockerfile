FROM caddy:2-alpine

ADD Caddyfile /etc/caddy/

RUN apk add --no-cache --update git \
    && mkdir /glowing-bear \
    && git clone https://github.com/glowing-bear/glowing-bear.git /glowing-bear/ \
    && cd /glowing-bear \
    && git checkout gh-pages \
    && apk del git \
    && rm -rf .git

WORKDIR /glowing-bear
