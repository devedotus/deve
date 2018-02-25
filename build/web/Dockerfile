FROM nginx:alpine

USER root

RUN set -x \
  && deluser www-data \
  && addgroup -g 500 -S www-data \
  && adduser -u 500 -D -S -G www-data www-data \
  && chown -R www-data: /etc/nginx

USER www-data

COPY config /etc/nginx
