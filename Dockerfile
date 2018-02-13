FROM ubuntu:16.04

MAINTAINER Andriy Koval <andrii.koval90@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
        apache2 \
        php \
        libapache2-mod-php \
        php-mysql \
        php-mcrypt \
        php-gd \
        php-ldap \
        php-imap \
        php-mbstring \
        php-curl \
        php-json \
        php-xml \
        php-zip  \
&& phpenmod mcrypt \
        gd \
        ldap \
        imap \
&& a2enmod rewrite \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY php.ini /etc/php/7.0/cli/php.ini
COPY php_apache.ini /etc/php/7.0/apache2/php.ini
COPY sentrifugo /var/www/html/sentrifugo

RUN chown -R www-data:www-data /var/www/html/sentrifugo

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
