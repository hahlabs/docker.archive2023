#!/bin/bash
groupadd --gid 15286 hahlabs 
useradd --home-dir /home/hahlabs --gid 15286 --uid 15286 --groups sudo,www-data hahlabs 
usermod -aG sudo root 
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers 
chown hahlabs:hahlabs /home/hahlabs 
cat 'hahlabs:Hahlabs!123' | chpasswd 
cat 'root:Root!123' | chpasswd 