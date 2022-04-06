FROM centos:latest
MAINTAINER frparvez9@gmail.com
RUN yum install -y httpd
RUN yum install zip
RUN yum install unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page273/savory.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip savory.zip
RUN cp -rvf savory/* .
RUN rm -rf savory savory.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80
