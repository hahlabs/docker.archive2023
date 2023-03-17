FROM ubuntu:latest
LABEL version.php="8.1.7" \
      version.ubuntu="22.04-lts" \
      version.grpc="1.46.3" \
      version.composer="2.0" \
      version.hahlabs-laravel="alpha-00.02.01"
# Setup workspace
WORKDIR /home/hahlabs
# copy build scripts & prepare
COPY files/. files/
# Update, Upgrade, install packages, create non-admin account
RUN files/upgrade-os.sh \
    && files/create-user.sh \
    && cp files/php-fpm-service /usr/local/bin \
    && cp files/startup.sh /usr/local/bin


# extract, compile and build php 8.1.7
RUN files/build-php.sh 
# Build xdebug
RUN files/build-xdebug.sh
#install composer 2
RUN files/install-composer.sh 
# compile & install grpc
RUN files/build-grpc.sh
# Setup NGINX virtual host 
RUN files/setup-nginx-virtual-host.sh
USER hahlabs
ENTRYPOINT sudo startup.sh && bash
# 8201  : NGINX virtual host edudate-app: http://localhost:8082
# 9000 : php-fpm port -used internally - no need to expose
# 8010 : php artisan serve --host=0.0.0.0 --port=8010 || php -S 0.0.0.0:8010 
# 9003 : XDebugger

EXPOSE  8201 8010 9003
