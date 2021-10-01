FROM php:5.6-apache

RUN apt-get update && apt-get install -y libzip-dev memcached \
        libmemcached11 \
        libmemcachedutil2 \
        libmemcached-dev \
        libmcrypt-dev \
    && docker-php-ext-install mcrypt mbstring zip pdo_mysql

RUN pecl install memcached-2.2.0 \
    && docker-php-ext-enable memcached

COPY .docker/apache2/000-default.conf /etc/apache2/sites-available/000-default.conf
COPY .docker/php/php.ini /usr/local/etc/php

RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin \
        && mv /usr/local/bin/composer.phar /usr/local/bin/composer
