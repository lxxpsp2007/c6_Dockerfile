#!/bin/bash

php_version=php-5.4.25

if [ ! -z "${fpm_port}" ];then
    sed -i "s/^listen = .*/listen = 0.0.0.0:${fpm_port}/g" /usr/local/${php_version}/etc/php-fpm.conf
fi

/usr/local/${php_version}/sbin/php-fpm -F
