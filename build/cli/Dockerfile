FROM wordpress:cli

USER root

# add the user and group we need to make the socket work
RUN set -x \
        && deluser www-data \
        && addgroup -g 500 -S www-data \
        && adduser -u 500 -D -S -G www-data www-data \
        && chown -R www-data: /usr/local/etc \
        && addgroup www-data ping

USER www-data
