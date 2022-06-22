FROM ubuntu
# Update, Upgrade, install packages
RUN apt update \
   && apt -y upgrade \
   && apt install -y mysql-server sudo

# Setup ops user use defaults uid 1000 gid 1000

WORKDIR /home/hahlabs
COPY files/. files/
RUN mkdir /home/mysql \
  && usermod -d /home/mysql mysql \
  && chown mysql:mysql /home/mysql \
  && chmod g+rwx /var/run/mysqld \
  && cp files/.bashrc . \
  && cp files/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf \
  && groupadd --gid 1000 hahlabs \
  && useradd --home-dir /home/hahlabs --gid 1000 --uid 1000 --groups sudo,mysql hahlabs \
  && usermod -aG sudo root  \
  && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
  && chown -R hahlabs:hahlabs /home/hahlabs \
  && exit

# Adjust user root privileges, allow remote connections for root
RUN service mysql restart && mysql  < files/root-user.sql 
USER hahlabs

# Enables the service on docker run container
ENTRYPOINT sudo service mysql restart && bash

EXPOSE 3306