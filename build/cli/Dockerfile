FROM wordpress:cli

USER root

# install wp-cli dependencies
RUN apk add --no-cache git
RUN set -ex; \
	git clone https://bitbucket.org/deveus/cli.git /var/www/cli; \
	chown -R www-data:www-data /var/www/cli;
  
USER www-data

RUN set -ex; \
	wp package install /var/www/cli