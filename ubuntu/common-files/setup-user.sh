#!/bin/bash
# creates hahlabs user & grant pemissions
groupadd --gid 15286 hahlabs 
useradd --home-dir /home/hahlabs --gid 15286 --uid 15286 --groups sudo -s /bin/bash hahlabs 
usermod -s /bin/bash root
echo "%sudo   ALL=(ALL:ALL) NOPASSWD:ALL" > /etc/sudoers 
echo 'hahlabs:Hahlabs!123' | chpasswd 
echo 'root:Root!123' | chpasswd 
cp /home/hahlabs/common-files/.bashrc /home/hahlabs
chown -R hahlabs:hahlabs /home/hahlabs