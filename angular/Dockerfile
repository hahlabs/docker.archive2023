FROM ubuntu:latest
LABEL version.angular="14-lts" \
      version.ubuntu="22.04-lts" \
      version.firebase="9.1.0" \
      version.nvm="8" \
      version.npm="16" \
      version.hahlabs-angular="alpha-00.02.02" \
      version.description="Timezone setup"

# Update, Upgrade, install packages
USER root
RUN apt update \
 && apt -y upgrade \
 && apt install -y nginx curl npm sudo vim

ENV TZ="America/Vancouver"
RUN DEBIAN_FRONTEND=noninteractive TZ=America/Vancouver apt-get -y install tzdata && ln -fs /usr/share/zoneinfo/America/Vancouver /etc/localtime
 # Setup home directory workspace
WORKDIR /home/hahlabs
COPY files/. files/
RUN files/setup-hahlabs-user.sh \
   && files/setup-nginx-virtual-host.sh

USER hahlabs
# Install nvm, load it, and install node --lts
RUN files/install-nvm.sh
# Install Angular using npm, and print version

RUN files/install-angular.sh
     
RUN files/install-firebase.sh
ENTRYPOINT sudo service nginx start && bash

# 8101 : NGINX with default virtual host to intial Angular project
# 4200 : ng serve
# 9005 : Debugger port
EXPOSE 8101 4200 9005