FROM php:5.6-apache

COPY ./docker/apache.conf /etc/apache2/sites-available/000-default.conf
COPY ./docker/app.ini /usr/local/etc/php/conf.d/app.ini

RUN curl -sS https://getcomposer.org/installer \
        | php -- --install-dir=/usr/local/bin \
        && mv /usr/local/bin/composer.phar /usr/local/bin/composer

RUN apt-get update && apt-get install -y \
  bzr \
  cvs \
  git \
  mercurial \
  subversion

COPY / /var/www/html
RUN composer install --prefer-source --no-interaction

CMD ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80
