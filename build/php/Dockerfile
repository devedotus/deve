FROM wordpress:fpm-alpine

RUN { \
    echo 'post_max_size=13M'; \
    echo 'upload_max_filesize=13M'; \
  } > /usr/local/etc/php/conf.d/docker-php-upload.ini;

RUN set -x \
    && deluser www-data \
    && addgroup -g 500 -S www-data \
    && adduser -u 500 -D -S www-data www-data \
    && rm /usr/local/etc/php-fpm.d/zz-docker.conf \
    && rm /usr/local/etc/php-fpm.d/www.conf.default \
    && rm /usr/local/etc/php-fpm.d/docker.conf