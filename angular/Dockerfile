FROM ubuntu
LABEL version.angular="13-lts" \
      version.ubuntu="20.04-lts" \
      version.firebase="9.1.0" \
      version.nvm="8" \
      version.npm="16" \
      version.hahlabs-angular="alpha-0.01.05"

# Update, Upgrade, install packages
USER root
RUN apt update \
 && apt -y upgrade \
 && apt install -y nginx curl npm sudo 


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
EXPOSE 8101 4200 9005