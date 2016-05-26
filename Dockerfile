FROM ubuntu:14.04

MAINTAINER Talita Bernardes

RUN apt-get update && apt-get install apache2 unzip zip mysql-client -y && apt-get clean && rm -rf /var/lib/apt/lists/*

VOLUME /home/TalitaBP/Documentos/LinuxTips

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

ADD prototipos-atualizados.zip /var/www/

EXPOSE 80

CMD ["cd", "/var/www/"]
CMD ["rm", "/var/www/index.html"]
CMD ["unzip", "/var/www/prototipos-atualizados.zip"]
CMD ["cd", "/var/www/prototipos-atualizados/"]
CMD ["mv", "*", "../"]

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]

