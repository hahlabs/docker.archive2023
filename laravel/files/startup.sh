#!/bin/bash
service php8.2-fpm stop
service nginx restart 
service php8.2-fpm start
service ssh restart
tail -f /dev/null