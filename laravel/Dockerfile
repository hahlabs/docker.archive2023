FROM ubuntu:22.04
LABEL version.php="8.2.14" \
      version.zend="4.2.14" \
      version.ubuntu="22.04-lts" \
      version.grpc="1.60.0" \
      version.composer="2.6.6" \
      version.hahlabs-laravel="alpha-00.04.01" \
      version.description="Rebuild for 22.04 & php8.x - Laravel 10.x"

WORKDIR /home/hahlabs
COPY files/. files/
# Update, Upgrade, install packages, create non-admin account
RUN apt -y update && apt -y upgrade
# has to be after update/upgrade commands
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Vancouver apt-get -y install tzdata && ln -fs /usr/share/zoneinfo/America/Vancouver /etc/localtime
RUN files/install-tools.sh
RUN files/create-user.sh
RUN files/install-composer.sh
RUN files/build-grpc.sh
RUN files/setup-nginx-virtual-host.sh
# Setup workspace

WORKDIR /home/hahlabs
RUN cp files/startup.sh /home/hahlabs \
    && chown hahlabs:hahlabs startup.sh \
    && rm -rf files

#SSH Services
RUN mkdir /var/run/sshd
RUN echo 'root:HAH7A85@#!' | chpasswd
RUN sed -Ei 's/#(PermitRootLogin).+/\1 yes/' /etc/ssh/sshd_config
RUN sed -Ei 's/#Port 22/Port 8222/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

USER hahlabs
# 80    : NGINX virtual host default: http://localhost:80 <-- removed
# 8201  : NGINX virtual host hahlabs app: http://localhost:8201
# 8222  : ssh 

# 9000 : php-fpm port -used internally - no need to expose
# 8210 : php artisan serve --host=0.0.0.0 --port=8210 || php -S 0.0.0.0:8210 
# 9003 : XDebugger, internal should not be exposed, VSCode will report port in use error if exposed
EXPOSE  8201 8210 8222 
ENTRYPOINT sudo ./startup.sh  && bash

