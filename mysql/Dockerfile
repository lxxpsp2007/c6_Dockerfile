FROM centos6:6.8
MAINTAINER  HJ lxxpsp2007@126.com

RUN rm -rf /etc/yum.repos.d/* 
ADD Centos-6.repo /etc/yum.repos.d/
RUN yum install -y yum-plugin-ovl
RUN yum -y install perl mysql-server mysql-devel
ADD run.sh /
RUN rm -rf /etc/my.cnf

EXPOSE 3306
CMD [ "/run.sh" ]
ENTRYPOINT [ "bash" ]
