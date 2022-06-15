FROM ubuntu
# Update, Upgrade, install packages
RUN apt update && apt -y upgrade
RUN apt install -y mysql-server sudo
# Setup ops user use defaults uid 1000 gid 1000
RUN    useradd -d /home/hahlabs hahlabs \
    && usermod -aG sudo hahlabs \
    && usermod -aG sudo root \
    && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
    && exit
WORKDIR /home/hahlabs
COPY .bashrc .
RUN chown -R hahlabs:hahlabs /home/hahlabs
COPY root-user.sql .
RUN mkdir /home/mysql && usermod -d /home/mysql mysql && chown mysql:mysql /home/mysql
RUN usermod -aG mysql hahlabs
RUN chmod g+rwx /var/run/mysqld
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

# Adjust user root privileges, allow remote connections for root
RUN service mysql restart && mysql  < root-user.sql 
USER hahlabs

# Enables the service on docker run container
ENTRYPOINT sudo service mysql restart && bash

EXPOSE 3306