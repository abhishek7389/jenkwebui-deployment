FROM centos

RUN yum install httpd -y 

COPY /travelvilla  /var/www/html

CMD /usr/sbin/httpd -DEFOREGROUND


