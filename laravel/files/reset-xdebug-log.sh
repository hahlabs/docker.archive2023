#!/bin/bash
echo 'XDebug 3.1.5 - HAHLABS' | sudo tee /var/log/xdebug.log
sudo chown www-data:www-data /var/log/xdebug.log
sudo chmod g+rw /var/log/xdebug.log