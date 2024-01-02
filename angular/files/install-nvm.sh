#!/bin/bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
cat <<EOF >>~/.bashrc
#!/bin/sh
# Created on $(date)
export NVM_DIR="$HOME/.nvm" 
[ -s "\$NVM_DIR/nvm.sh" ] && \. "\$NVM_DIR/nvm.sh" 
[ -s "\$NVM_DIR/bash_completion" ] && \. "\$NVM_DIR/bash_completion" 

EOF

export NVM_DIR="$HOME/.nvm" 
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
nvm install 20.10.0

