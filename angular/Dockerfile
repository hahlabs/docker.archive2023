FROM ubuntu
# Update, Upgrade, install packages
RUN apt update && apt -y upgrade
RUN apt install -y nginx curl npm sudo
RUN useradd hahlabs \
    && usermod -aG sudo -d /home/hahlabs hahlabs \
    && usermod -aG sudo root \
    && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
    && exit

# Setup home directory workspace
WORKDIR /home/hahlabs
COPY .bashrc .
RUN chown -R hahlabs:hahlabs /home/hahlabs

# configure nginx - edudate-app virtual host
COPY nginx-app-view /etc/nginx/sites-available/hahlabs-view
COPY index.html /var/www/hahlabs-view/index.html
RUN ln -s /etc/nginx/sites-available/hahlabs-view /etc/nginx/sites-enabled/hahlabs-view

USER hahlabs

# Install nvm, load it, and install node --lts
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
&& export NVM_DIR="$HOME/.nvm"  \
&& [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
&& [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
&& nvm install --lts \ 
&& exit
# Install Angular using npm, and print version

RUN export NVM_DIR="$HOME/.nvm"  \
     && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
     && [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" \
     && npm install --location=global @angular/cli@v13-lts \
     && echo "N" | ng version 
     
RUN curl -sL https://firebase.tools | bash

ENTRYPOINT sudo service nginx start && bash
EXPOSE 8081 4200 9005
