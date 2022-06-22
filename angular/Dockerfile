FROM ubuntu
LABEL version.angular="13-lts" \
      version.ubuntu="20.04-lts" \
      version.firebase="9.1.0" \
      version.nvm="8" \
      version.npm="16"
# Update, Upgrade, install packages
RUN apt update \
 && apt -y upgrade \
 && apt install -y nginx curl npm sudo 


 # Setup home directory workspace
WORKDIR /home/hahlabs
COPY files/. files/
RUN groupadd --gid 1000 hahlabs \
 && useradd --home-dir /home/hahlabs --gid 1000 --uid 1000 --groups sudo hahlabs \
 && usermod -aG sudo root  \
 && echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers \
 && cp files/.bashrc . \
 && cp files/nginx-app-view /etc/nginx/sites-available/hahlabs-view \
 && mkdir /var/www/hahlabs-view \
 && cp files/index.html /var/www/hahlabs-view/index.html \
 && ln -s /etc/nginx/sites-available/hahlabs-view /etc/nginx/sites-enabled/hahlabs-view \
 && chown -R hahlabs:hahlabs /home/hahlabs \
 && exit
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
     && echo "N" | ng version \
     && ng new hahapp --defaults=true --interactive=false --package-manager="npm" --routing=true --style="scss" --skip-git=true \
     && cd hahapp \
     && ng build \
     && sudo cp -R dist/hahapp/. /var/www/hahlabs-view
     
RUN curl -sL https://firebase.tools | bash

ENTRYPOINT sudo service nginx start && bash
EXPOSE 8081 4200 9005