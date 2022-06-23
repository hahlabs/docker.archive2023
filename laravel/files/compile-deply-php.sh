#!/bin/bash
tar xzf files/php-8.1.7.tar.gz 
cd php-8.1.7 
../files/make-php.sh
cp sapi/fpm/php-fpm /usr/local/bin 
cp sapi/fpm/php-fpm.service /lib/systemd/system 
systemctl enable php-fpm.service 
cd .. 
cp files/php.ini /usr/local/lib 
cp files/php-fpm.conf /usr/local/etc/php-fpm.conf 
cp files/www.conf /usr/local/etc/php-fpm.d/www.conf 
