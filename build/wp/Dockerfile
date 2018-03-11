FROM wordpress:cli
COPY docker-entrypoint.sh /usr/local/bin/
USER root
RUN set -ex; \
    mkdir -p /var/www && \
    chown www-data:www-data /var/www && \
    chmod 0755 /usr/local/bin/docker-entrypoint.sh
USER www-data
VOLUME /var/www
