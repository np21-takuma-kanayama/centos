FROM centos:8

RUN localedef -i ja_JP -f UTF-8 ja_JP.UTF-8
RUN echo 'LANG="ja_JP.UTF-8"' > /etc/locale.conf
ENV LANG ja_JP.UTF-8

RUN echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock 
RUN rm -f /etc/localtime
RUN ln -fs /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

RUN sed -i -e"s/^tsflags=nodocs/\# tsflags=nodocs/" /etc/yum.conf

RUN yum update -y \
 && yum install -y \
    man \
    man-pages.noarch \
    man-pages-ja.noarch \
 && yum clean all