FROM  centos6
MAINTAINER  HJ lxxpsp2007@126.com

ADD nginx-1.10.2.tar.gz /usr/local/
ADD inotify.tar.gz /usr/local/
ADD run.sh /

EXPOSE 80
CMD [ "/run.sh" ]
ENTRYPOINT [ "bash" ]

#/var/log/nginx/  /etc/nginx/conf/  /data/www/www
