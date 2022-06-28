#!/bin/bash
export NVM_DIR="$HOME/.nvm"  
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
npm install --location=global @angular/cli@v13-lts 
echo "N" | ng version 
ng new hahview --defaults=true --interactive=false --package-manager="npm" --routing=true --style="scss" --skip-git=true 
cd hahview 
ng build 
sudo cp -R dist/hahview/. /var/www/hahlabs-view