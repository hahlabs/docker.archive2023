#!/bin/bash
# configure nginx - edudate-app virtual host

composer create-project laravel/laravel hahlabs-app
chmod -R gou+rwx hahlabs-app/storage
chown -R hahlabs:hahlabs hahlabs-app
cp files/nginx-hahlabs-app /etc/nginx/sites-available/hahlabs-app 
ln -s /etc/nginx/sites-available/hahlabs-app /etc/nginx/sites-enabled/hahlabs-app 
ln -s /home/hahlabs/hahlabs-app /var/www/hahlabs-app
cp files/nginx.index.html /var/www/hahlabs-app/public/index-test.html 
cp files/index.php /var/www/hahlabs-app/public/index-test.php 
rm /etc/nginx/sites-enabled/default