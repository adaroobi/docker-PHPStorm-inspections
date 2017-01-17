FROM php:7.0-cli

#install PHPCS
RUN pear install PHP_CodeSniffer

#download PHPMD
RUN curl -o /usr/bin/phpmd.phar -L http://static.phpmd.org/php/latest/phpmd.phar \
    && chmod +x /usr/bin/phpmd.phar

RUN apt update \
    && apt install libbz2-dev \
    && docker-php-ext-install bz2 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
