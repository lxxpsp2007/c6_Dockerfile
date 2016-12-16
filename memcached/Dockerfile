FROM centos6
MAINTAINER  HJ lxxpsp2007@126.com

RUN yum install -y memcached
ADD run.sh /
CMD [ "/run.sh" ]
ENTRYPOINT [ "bash" ]
