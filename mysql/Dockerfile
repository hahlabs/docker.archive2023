FROM ubuntu:latest
LABEL version.mysql="8.x" \
      version.ubuntu="22.04-lts" \
      version.hahlabs-mysql="alpha-00.02.01"
# Update, Upgrade, install packages
RUN apt update \
   && apt -y upgrade \
   && apt install -y mysql-server sudo vim

# Setup ops user use defaults uid 1000 gid 1000

WORKDIR /home/hahlabs
COPY files/. files/
RUN files/setup-mysql-user.sh

# Adjust user root privileges, allow remote connections for root
RUN service mysql restart && mysql  < files/root-user.sql 
USER hahlabs

# Enables the service on docker run container
ENTRYPOINT sudo service mysql restart && bash

EXPOSE 3306