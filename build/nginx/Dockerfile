FROM nginx:alpine

COPY config /etc/nginx
COPY html /var/www/html

RUN set -ex; \
	apk add --no-cache --virtual .build-deps \
		openssl \
	; \
    mkdir -p /etc/nginx/sites-available && \
    mkdir -p /etc/nginx/sites-enabled && \
    addgroup -g 82 -S www-data && \
    adduser -u 82 -D -S www-data www-data && \
    chown www-data:www-data /var/www && \
    chown www-data:www-data /etc/nginx/sites-available && \
    chown www-data:www-data /etc/nginx/sites-enabled && \
    mkdir -p /etc/ssl/private && \
    mkdir -p /etc/ssl/certs && \
    \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
        -keyout /etc/ssl/private/localhost.key \
        -out /etc/ssl/certs/localhost.crt US CA Private Localhost Development localhost \
    \
	apk del .build-deps

VOLUME /var/www /etc/nginx

EXPOSE 80 443
