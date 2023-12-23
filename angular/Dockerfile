FROM ubuntu:22.04
LABEL version.angular="17.0.8" \
      version.ubuntu="22.04-lts" \
      version.firebase="13.0.2" \
      version.nvm="0.39.7" \
      version.node.js="20.10.0-lts" \
      version.npm="10.2.3" \
      version.hahlabs-angular="alpha-00.03.01" \
      version.description="Ubuntu 22.04 - Angular 17"

# Update, Upgrade, install packages
USER root
RUN apt -y update \
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

RUN sudo rm -rf files

# 8101 : NGINX with default virtual host to intial Angular project
# 4200 : ng serve
# 9005 : Debugger port
EXPOSE 8101 4200 9005
ENTRYPOINT sudo service nginx start && bash