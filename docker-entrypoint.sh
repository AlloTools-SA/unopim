#!/bin/bash

case "$1" in
    frankenphp)
        composer require unopim/dam
        php artisan dam-package:install -n
        php artisan optimize:clear

        touch /tmp/startup_complete

        exec docker-php-entrypoint "$@"
        ;;
    queue)
        php artisan queue:listen -n --env=production
        ;;
esac

