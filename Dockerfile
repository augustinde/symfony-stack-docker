FROM php:8.0-fpm-alpine

RUN apk --no-cache update && apk --no-cache add bash git

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php --install-dir=/usr/local/bin --filename=composer
RUN php -r "unlink('composer-setup.php');"

RUN wget https://get.symfony.com/cli/installer -O - | bash &&  mv /root/.symfony/bin/symfony /usr/local/bin/symfony


RUN docker-php-ext-install pdo_mysql

RUN git config --global user.email "augustin.1201@outlook.fr"
RUN git config --global user.name "augustinde"

ENV APP_ENV dev
WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html
