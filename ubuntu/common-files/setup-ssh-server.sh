#!/bin/bash
# run as root
apt install -y openssh-server
mkdir /var/run/sshd
sed -Ei 's/#(PermitRootLogin).+/\1 yes/' /etc/ssh/sshd_config
sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
echo "export VISIBLE=now" >> /etc/profile
