#!/bin/bash
set -e
 
docker-compose down --volumes
docker rmi irct_2_apache irct_2_php_fpm

