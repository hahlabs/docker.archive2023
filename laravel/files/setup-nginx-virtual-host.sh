#!/bin/bash
# configure nginx - edudate-app virtual host

composer create-project laravel/laravel hahlabs-app
chmod -R gou+rwx hahlabs-app/storage
chown -R hahlabs:hahlabs hahlabs-app
cp files/nginx-hahlabs-app-virtual-host /etc/nginx/sites-available/hahlabs-app 
ln -s /etc/nginx/sites-available/hahlabs-app /etc/nginx/sites-enabled/hahlabs-app 
ln -s /home/hahlabs/hahlabs-app /var/www/hahlabs-app
cp files/nginx.index.html /var/www/hahlabs-app/public/index-test.html 
cp files/phpinfo.php /var/www/hahlabs-app/public/phpinfo.php 
rm /etc/nginx/sites-enabled/default
cp files/php.ini /etc/php/8.2/cli/php.ini