FROM ubuntu:14.04
MAINTAINER jcrphx@gmail.com

Label version="7.0" location="Phoenix" type="test" automate="true"

RUN apt-get update && apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
copy supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
