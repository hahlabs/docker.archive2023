#!/bin/bash
mkdir -p /var/www/hahlabs-view
cp files/index.html /var/www/hahlabs-view/index.html
cp files/nginx-hahlabs-view-virtual-host /etc/nginx/sites-available/hahlabs-view
ln -s /etc/nginx/sites-available/hahlabs-view /etc/nginx/sites-enabled/hahlabs-view
exit