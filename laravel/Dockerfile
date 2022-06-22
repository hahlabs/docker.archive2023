FROM ubuntu
LABEL version.php="8.1.7" \
      version.ubuntu="20.04-lts" \
      version.grpc="1.46.3" \
      version.composer="2.0"
# Update, Upgrade, install packages
RUN apt update && apt -y upgrade
# Setup workspace
WORKDIR /home/hahlabs
RUN apt install -y apt-utils sudo
RUN  groupadd --gid 1000 hahlabs \
  && useradd --home-dir /home/hahlabs --gid 1000 --uid 1000 --groups sudo hahlabs \ 
  && usermod -aG sudo root \
  && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
  && chown hahlabs:hahlabs /home/hahlabs \
  && exit

# copy build scripts & prepare
COPY files/. files/

# extract, compile and build php 8.1.7
RUN tar xzf files/php-8.1.7.tar.gz \
     && cd php-8.1.7 \
     && ../files/build-php \
     && cp sapi/fpm/php-fpm /usr/local/bin \
     && cd .. \
     && cp files/php.ini /usr/local/lib \
     && cp files/php-fpm.conf /usr/local/etc/php-fpm.conf \
     && cp files/www.conf /usr/local/etc/php-fpm.d/www.conf \
     # configure nginx - edudate-app virtual host
     && cp files/nginx-hahlabs-app /etc/nginx/sites-available/hahlabs-app \
     && ln -s /etc/nginx/sites-available/hahlabs-app /etc/nginx/sites-enabled/hahlabs-app \
     && mkdir -p /var/www/hahlabs-app/public \
     && cp files/nginx.index.html /var/www/hahlabs-app/public/index.html \
     && cp files/index.php /var/www/hahlabs-app/public/index.php \
     && rm /etc/nginx/sites-enabled/default

# compile & install grpc
RUN files/build-grpc

#install composer 2
RUN files/install-composer

USER hahlabs

ENTRYPOINT sudo php-fpm && sudo service nginx start && bash
# 8081 : NGINX virtual host edudate-app: http://localhost:8081
# 9000 : php-fpm port -used internally
# 8000 : php artisan serve --host=0.0.0.0 --port=8000 || php -S 0.0.0.0:8000 
EXPOSE  8082 8000
