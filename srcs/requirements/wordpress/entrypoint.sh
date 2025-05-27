#!/bin/bash

mkdir -p /run/php
chown www-data:www-data /run/php

if [ -z "$(ls -A /var/www/html/)" ]; then
   cp -R /usr/src/wordpress/* /var/www/html/
fi

chown -R www-data:www-data /var/www/html

exec "$@" 