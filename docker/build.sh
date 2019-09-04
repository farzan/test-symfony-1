#!/bin/bash
set -e
 
if ! [[ -d ../containers/logs/apache ]]; then
    mkdir -p ../containers/logs/apache
fi
 
if ! [[ -d ../containers/logs/mysql ]]; then
    mkdir -p ../containers/logs/mysql
fi
 
if ! [[ -d ../containers/logs/php ]]; then
    mkdir -p ../containers/logs/php
fi
 
if ! [[ -d ../containers/database ]]; then
    mkdir ../containers/database
fi

# todo touch the .bash_history file in /{containers}/php-fpm/
 
docker-compose up -d --build
 
docker exec irct_2_apache chown -R root:www-data /usr/local/apache2/logs
docker exec irct_2_php_fpm chown -R root:www-data /usr/local/etc/logs

