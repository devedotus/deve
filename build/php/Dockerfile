FROM php:7.2-fpm-alpine

# install the PHP extensions we need
RUN set -ex; \
	\
	apk add --no-cache --virtual .build-deps \
		libjpeg-turbo-dev \
		libpng-dev \
		bzip2-dev \
		icu-dev \
		libmemcached-dev \
		cyrus-sasl-dev \
	; \
	\
	curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" && \
	    mkdir -p /usr/src/php/ext/memcached && \
	    tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1; \
	\
	docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr; \
	docker-php-ext-configure memcached; \
	docker-php-ext-install bcmath bz2 calendar gd mysqli opcache zip sockets intl sysvmsg memcached; \
	\
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --virtual .wordpress-phpexts-rundeps $runDeps; \
	apk del .build-deps; \
	rm /tmp/memcached.tar.gz 

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini

RUN { \
    echo 'post_max_size=13M'; \
    echo 'upload_max_filesize=13M'; \
  } > /usr/local/etc/php/conf.d/docker-php-upload.ini;

VOLUME /var/www
CMD ["php-fpm"]
