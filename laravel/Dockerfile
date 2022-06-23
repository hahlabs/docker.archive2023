FROM ubuntu
LABEL version.php="8.1.7" \
      version.ubuntu="20.04-lts" \
      version.grpc="1.46.3" \
      version.composer="2.0" \
      version.hahlabs-app="alpha-0.01.05"
# Setup workspace
WORKDIR /home/hahlabs
# copy build scripts & prepare
COPY files/. files/
# Update, Upgrade, install packages, create non-admin account
RUN files/upgrade-os.sh \
    && files/create-user.sh \
    && cp files/startup.sh /usr/local/bin
# extract, compile and build php 8.1.7
RUN files/compile-deply-php-nginx.sh 
#install composer 2
RUN files/install-composer.sh 
# compile & install grpc
RUN files/build-grpc.sh
USER hahlabs
ENTRYPOINT sudo startup.sh && bash
# 8082 : NGINX virtual host edudate-app: http://localhost:8082
# 9000 : php-fpm port -used internally
# 8000 : php artisan serve --host=0.0.0.0 --port=8000 || php -S 0.0.0.0:8000 
EXPOSE  8082 8000
