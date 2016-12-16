FROM centos6:6.8
MAINTAINER  HJ lxxpsp2007@126.com

RUN rm -rf /etc/yum.repos.d/*
ADD Centos-6.repo /etc/yum.repos.d/
ADD run.sh /
RUN yum install -y yum-plugin-ovl
RUN yum -y install php-fpm php php-gd
RUN rm -rf /etc/php-fpm.d/www.conf
ADD www.conf  /etc/php-fpm.d/www.conf

CMD [ "/run.sh" ]
ENTRYPOINT [ "bash" ]
