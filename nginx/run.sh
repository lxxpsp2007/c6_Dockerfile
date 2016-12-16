#!/bin/bash

sed -i "/location/a\    fastcgi_pass ${php_server}:${port};" /usr/local/nginx-1.10.2/conf/php-fpm.conf
nginx
