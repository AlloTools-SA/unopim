#!/bin/bash

composer require unopim/dam
php artisan dam-package:install -n
php artisan optimize:clear

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
