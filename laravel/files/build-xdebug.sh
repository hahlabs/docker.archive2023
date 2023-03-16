#!/bin/bash
tar xzf files/xdebug-3.1.5.tgz 
cd xdebug-3.1.5
phpize
./configure
make
cp modules/xdebug.so /usr/local/lib/php/extensions/debug-non-zts-20210902
mkdir -p /var/log/xdebug
echo "XDebug 3.1.5 - HAHLABS.COM" > /var/log/xdebug/xdebug.log
chown www-data:www-data /var/log/xdebug/xdebug.log
chmod g+rw /var/log/xdebug/xdebug.log
cp ../files/reset-xdebug-log.sh /usr/local/bin
ln -s /usr/local/bin/reset-xdebug-log.sh /usr/local/bin/reset-xdebug-log