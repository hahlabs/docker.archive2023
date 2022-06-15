FROM ubuntu
# Update, Upgrade, install packages
RUN apt update && apt -y upgrade
# Setup workspace
WORKDIR /home/hahlabs
RUN apt install -y apt-utils sudo
RUN useradd hahlabs \ 
  && usermod -aG sudo -d /home/hahlabs hahlabs \
  && usermod -aG sudo root \
  && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
  && chown hahlabs:hahlabs /home/hahlabs \
  && exit

# copy build scripts & prepare
COPY build-grpc .
COPY install-composer .
COPY php-8.1.7.tar.gz .
RUN tar xzf php-8.1.7.tar.gz
#compile and build php 8.1.7
WORKDIR /home/hahlabs/php-8.1.7
COPY build-php .
RUN  ./build-php
COPY php.ini /usr/local/lib
COPY php-fpm.conf /usr/local/etc/php-fpm.conf
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
RUN  cp sapi/fpm/php-fpm /usr/local/bin


WORKDIR /home/hahlabs

RUN ./build-grpc

#install composer 2
RUN ./install-composer

# configure nginx - edudate-app virtual host
RUN apt install -y nginx
COPY nginx-hahlabs-app /etc/nginx/sites-available/hahlabs-app
RUN ln -s /etc/nginx/sites-available/hahlabs-app /etc/nginx/sites-enabled/hahlabs-app
COPY nginx.index.html /var/www/hahlabs-app/public/index.html
COPY index.php /var/www/hahlabs-app/public/index.php

USER hahlabs

ENTRYPOINT sudo php-fpm && sudo service nginx start && bash

EXPOSE  8082 9000
