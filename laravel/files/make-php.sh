#!/bin/bash
# gcc compiler + others
apt install -y \
	 build-essential \
	 nginx \
	 autoconf \
	 pkgconf \
	 libxml2-dev  \
	 libsqlite3-dev \
	 zlib1g-dev \
	 libcurl4-openssl-dev \
	 libsodium-dev \
	 libssl-dev \
	 libcurl4-openssl-dev \
	 libpng-dev \
	 libssl-dev \
	 libjpeg-dev \
	 libzip-dev \
	 libmysqlclient-dev \
	 re2c \
	 bison \
	 libonig-dev \
	 libfcgi-dev \
	 libfcgi0ldbl \
	 libxpm-dev \
	 libgd-dev \
	 libfreetype6-dev \
	 libxslt1-dev \
	 libpspell-dev \
	 libgccjit-10-dev \
	 libsystemd-dev \
	 libwebp-dev 	 


./configure --prefix /usr/local \
	            --enable-fpm \
	            --enable-debug \
	            --with-fpm-user=www-data \
	            --with-fpm-group=www-data \
	            --enable-cli \
	            --with-fpm-systemd \
	            --with-openssl \
	            --with-zlib \
	            --with-curl \
	            --enable-gd \
	            --with-webp \
	            --with-jpeg \
	            --enable-intl \
	            --enable-mbstring \
	            --with-mysqli \
	            --with-mysql-sock=/var/run/php \
	            --with-pdo-mysql \
	            --enable-opcache \
	            --enable-sockets \
	            --enable-soap \
	            --enable-zend-test \
	            --with-zip \
	            --with-pear \
	            --with-sodium
make
echo "N" | make test
make install
