#!/bin/sh
set -euo pipefail

# For development purposes
export PATH="/var/cli/vendor/bin:$PATH"

# if we don't have the default let's set it up
if [ ! -d "/var/www/$DEVE_DOMAIN" ]; then
    while ! mysqladmin ping -h"mysql" --silent; do
        sleep 1
    done

    set -- wp deve setup
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