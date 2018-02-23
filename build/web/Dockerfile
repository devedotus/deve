FROM nginx:alpine

RUN set -x \
  && addgroup -g 500 -S www-data \
  && adduser -u 500 -D -S -G www-data www-data

COPY config /etc/nginx