FROM nginx:alpine

COPY config /etc/nginx
COPY html /var/www/html

RUN set -ex; \
    mkdir -p /etc/nginx/sites-available && \
    mkdir -p /etc/nginx/sites-enabled && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -D -S www-data www-data && \
    chown www-data:www-data /var/www && \
    chown www-data:www-data /etc/nginx/sites-available && \
    chown www-data:www-data /etc/nginx/sites-enabled

VOLUME /var/www /etc/nginx

EXPOSE 8080 4433
