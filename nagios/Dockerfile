FROM ubuntu:14.04
MAINTAINER TALITA BERNARDES

RUN apt-get update && apt-get -y install nagios3 



VOLUME /home/TalitaBP/Documentos/LinuxTips

ADD  monitor.cfg  /etc/nagios3/conf.d
EXPOSE 3000


CMD ["/etc/init.d/nagios3 start"]

