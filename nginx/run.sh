
ng_root=/usr/local/nginx-1.10.2

if [ ! -z ${NGINX_VAR} ];then
    ${ng_root}/sbin/nginx "${NGINX_VAR}" 
else
    ${ng_root}/sbin/nginx
fi

oldcksum=`cksum ${ng_root}/conf/auto_reload`

/usr/local/inotify/bin/inotifywait -e modify,move,create,delete -mr --timefmt '%d/%m/%y %H:%M' --format '%T' \
${ng_root}/conf/ | while read date time; do

    newcksum=`cksum ${ng_root}/conf/auto_reload`
    if [ "$newcksum" != "$oldcksum" ]; then
        #echo "At ${time} on ${date}, config file update detected."
        oldcksum=$newcksum
        ${ng_root}/sbin/nginx -s reload
    fi

done
