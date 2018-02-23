FROM nginx:alpine

RUN set -x \
  && addgroup -S www-data \
  && adduser -D -S -G www-data www-data

COPY config /etc/nginx