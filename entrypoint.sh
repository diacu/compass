#!/bin/bash

set -e

CUSER="frontend"
MYUID=`stat -c "%u" .`
APP_DIR="${APP_DIR:-/var/www/html}"

if [[ "$MYUID" -gt '0' && "$MYUID" != `id -u ${CUSER}` ]]; then
    usermod -u ${MYUID} ${CUSER}
fi

cd ${APP_DIR}

if [ -z "$@" ]; then
    compass watch --poll
else
    exec "$@"
fi
