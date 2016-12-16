#!/bin/bash


if [ ! -z "${fpm_port}" ];then
    sed -i "s/^listen = .*/listen = 0.0.0.0:${fpm_port}/g" /etc/php-fpm.d/www.conf
fi

php-fpm -F
