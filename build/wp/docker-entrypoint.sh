#!/bin/sh
set -euo pipefail

# For development purposes
export PATH="/var/cli/vendor/bin:$PATH"

# check if we have mysql running first
while ! mysqladmin ping -h"mysql" --silent; do
    sleep 1
done

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