FROM hahlabs/ubuntu:dev
LABEL version.php="8.2.14" \
      version.zend="4.2.14" \
      version.ubuntu="22.04-lts" \
      version.grpc="1.60.0" \
      version.composer="2.6.6" \
      version.hahlabs-laravel="alpha-00.05.02" \
      version.description="Rebuild for 22.04 & php8.x - Laravel 10.x"


WORKDIR /home/hahlabs
COPY files/. files/
USER root
RUN  files/install-tools.sh \
    && files/install-composer.sh \
    && files/build-grpc.sh \
    && files/setup-nginx-virtual-host.sh


    # Setup workspace

WORKDIR /home/hahlabs
RUN cp files/startup.sh /home/hahlabs \
    && rm -rf files \
    && sed -Ei 's/#Port 22/Port 8222/' /etc/ssh/sshd_config



USER hahlabs
# 80    : NGINX virtual host default: http://localhost:80 <-- removed
# 8201  : NGINX virtual host hahlabs app: http://localhost:8201
# 8222  : ssh 

# 9000 : php-fpm port -used internally - no need to expose
# 8210 : php artisan serve --host=0.0.0.0 --port=8210 || php -S 0.0.0.0:8210 
# 9003 : XDebugger, internal should not be exposed, VSCode will report port in use error if exposed
EXPOSE  8201 8210 8222 
ENTRYPOINT sudo ./startup.sh  

