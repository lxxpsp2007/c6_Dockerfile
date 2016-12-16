#!/bin/bash

DATA_DIR=/var/lib/mysql

INIT_MYSQL (){
    mysql_install_db --user=mysql --defaults-file=/etc/mysql/my.cnf
    mysqld_safe --defaults-file=/etc/mysql/my.cnf
}

INIT_USER () {
    ROOT_PASSWORD=123123
mysql << EOF
    DROP DATABASE test;
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    UPDATE mysql.user SET Password=PASSWORD('${ROOT_PASSWORD}') WHERE User='root';
    grant all on *.*  to root@'10.0.46.163' identified by '${ROOT_PASSWORD}';
    grant all on *.*  to root@'172.1.%.%' identified by '${ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOF
}

CHECK_CONN (){
    A=true
    while $A ; do
        mysql -e "show databases"
        if [ "$?" = "0" ] ;then
             INIT_USER
             A=false
        fi
        sleep 2
    done
}

if [ ! -e "${DATA_DIR}/mysql" ] ;then
    (CHECK_CONN) &
    INIT_MYSQL
else
    mysqld_safe --defaults-file=/etc/mysql/my.cnf
fi
