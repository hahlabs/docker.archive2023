#!/bin/bash
tar xzf files/xdebug-3.1.5.tgz 
cd xdebug-3.1.5
phpize
./configure
make
cp modules/xdebug.so /usr/local/lib/php/extensions/debug-non-zts-20210902
