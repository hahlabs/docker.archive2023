#!/bin/bash
groupadd --gid 1000 hahlabs 
useradd --home-dir /home/hahlabs --gid 1000 --uid 1000 --groups sudo hahlabs 
usermod -aG sudo root  
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers 
cp files/.bashrc /home/hahlabs
chown -R hahlabs:hahlabs /home/hahlabs 
