FROM nginx:alpine

COPY config /etc/nginx
COPY html /var/www/html

EXPOSE 8080
VOLUME /var/www /etc/nginx

RUN set -x \
    && addgroup -g 500 -S www-data \
    && adduser -u 500 -D -S www-data www-data \
    && chmod -R go+rwx /var/cache/nginx \
    && chmod -R go+rwx /var/run

USER www-data