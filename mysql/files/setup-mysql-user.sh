#!/bin/bash
mkdir /home/mysql
usermod -d /home/mysql mysql 
chown mysql:mysql /home/mysql 
chmod g+rwx /var/run/mysqld 
sed -Ei "s/127.0.0.1/0.0.0.0/" /etc/mysql/mysql.conf.d/mysqld.cnf 
groupadd --gid 15268 hahlabs 
useradd --home-dir /home/hahlabs --gid 15268 --uid 15268 --groups sudo,mysql hahlabs 
usermod -aG sudo root  
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers 
chown -R hahlabs:hahlabs /home/hahlabs 