FROM ubuntu:latest
LABEL version.php="8.2.14" \
      version.ubuntu="22.04-lts" \
      version.grpc="1.46.3" \
      version.composer="2.6" \
      version.hahlabs-laravel="alpha-00.03.00" \
      version.description="Timezone set, xdebug php.ini port 9030"

WORKDIR /home/hahlabs
# copy build scripts & prepare
COPY files/. files/
# Update, Upgrade, install packages, create non-admin account
RUN files/upgrade-os.sh  
RUN files/create-user.sh
RUN files/install-composer.sh
RUN files/build-grpc.sh
RUN files/setup-nginx-virtual-host.sh
USER hahlabs

# Setup workspace
ENV TZ="America/Vancouver"
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Vancouver apt-get -y install tzdata && ln -fs /usr/share/zoneinfo/America/Vancouver /etc/localtime
# 8201  : NGINX virtual host edudate-app: http://localhost:8082
# 9000 : php-fpm port -used internally - no need to expose
# 8210 : php artisan serve --host=0.0.0.0 --port=8210 || php -S 0.0.0.0:8210 
# 9003 : XDebugger, internal should not be exposed, VSCode will report port in use error if exposed
ENTRYPOINT sudo files/startup.sh && bash
EXPOSE  8201 8210 
