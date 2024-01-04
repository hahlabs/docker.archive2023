FROM hahlabs/ubuntu:dev
LABEL version.angular="17.0.8" \
      version.ubuntu="22.04-lts" \
      version.firebase="13.0.2" \
      version.nvm="0.39.7" \
      version.node.js="20.10.0-lts" \
      version.npm="10.2.3" \
      version.hahlabs-angular="alpha-00.05.02" \
      version.description="Ubuntu 22.04 - Angular 17"

COPY files/. files/
# Update, Upgrade, install packages
USER root
RUN apt install -y nginx curl npm 
WORKDIR /home/hahlabs

RUN files/setup-nginx-virtual-host.sh \
   && sed -Ei 's/#Port 22/Port 8122/' /etc/ssh/sshd_config

USER hahlabs
# Install nvm, load it, and install node --lts
RUN files/install-nvm.sh 

# Install Angular using npm, and print version

RUN files/install-angular.sh
     
RUN files/install-firebase.sh

RUN cp files/startup.sh /home/hahlabs \
    && sudo rm -rf files

# 8101 : NGINX with default virtual host to intial Angular project
# 4200 : ng serve
# 9005 : Debugger port
EXPOSE 8101 4200 9005 8122
ENTRYPOINT sudo ./startup.sh 