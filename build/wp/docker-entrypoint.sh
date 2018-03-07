#!/bin/sh
set -euo pipefail

echo "docker-entrypoint.sh"

# if we don't have the default let's set it up
if [ ! -d "/var/www/$DEVE_DOMAIN" ]; then
    echo "before sleep"
    while ! mysqladmin ping -h"mysql" --silent; do
        echo "sleep"
        sleep 1
    done
    echo "done sleeping"

    PASSWDDB=$(openssl rand -base64 24)
    mysql -h"mysql" -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DEVE_DATABASE} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
    mysql -h"mysql" -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE USER '${DEVE_USER}'@'%' IDENTIFIED BY '${PASSWDDB}';"
    mysql -h"mysql" -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DEVE_DATABASE}.* TO '${DEVE_USER}'@'%';"
    mysql -h"mysql" -uroot -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"

    mkdir -p "/var/www/$DEVE_DOMAIN" && cd $_
    wp core download
    wp core config --dbname=$DEVE_DOMAIN --dbuser=$DEVE_DOMAIN --dbpass=$PASSWDDB
    wp db create
    wp core install --url=$DEVE_DOMAIN --title="$DEVE_TITLE" --admin_user=$DEVE_USER --admin_password=$DEVE_PASSWORD --admin_email=$DEVE_EMAIL
    # set -- wp "deve site create $DEVE_DOMAIN"
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- wp "$@"
fi

# if our command is a valid wp-cli subcommand, let's invoke it through wp-cli instead
# (this allows for "docker run wordpress:cli help", etc)
if wp --path=/dev/null help "$1" > /dev/null 2>&1; then
	set -- wp "$@"
fi

exec "$@"