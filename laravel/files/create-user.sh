#!/bin/bash
groupadd --gid 10000 hahlabs 
useradd --home-dir /home/hahlabs --gid 10000 --uid 10000 --groups sudo,www-data hahlabs 
usermod -aG sudo root 
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers 
chown hahlabs:hahlabs /home/hahlabs 
