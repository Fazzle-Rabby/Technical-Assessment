FROM centos:latest
MAINTAINER frparvez9@gmail.com
RUN yum install -y httpd \
  zip \
 unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page273/speed.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip speed.zip
RUN cp -rvf speed/* .
RUN rm -rf speed speed.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
