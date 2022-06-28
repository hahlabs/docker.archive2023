#!/bin/bash
mkdir /home/mysql
usermod -d /home/mysql mysql 
chown mysql:mysql /home/mysql 
chmod g+rwx /var/run/mysqld 
cp files/.bashrc /home/hahlabs
cp files/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf 
groupadd --gid 1000 hahlabs 
useradd --home-dir /home/hahlabs --gid 1000 --uid 1000 --groups sudo,mysql hahlabs 
usermod -aG sudo root  
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers 
chown -R hahlabs:hahlabs /home/hahlabs 