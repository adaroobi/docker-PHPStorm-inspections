FROM php:7.0-alpine

#install PHP Code Sniffer
RUN pear install PHP_CodeSniffer

#install PHP Mess Detector
RUN curl -o /usr/bin/phpmd.phar -L http://static.phpmd.org/php/latest/phpmd.phar \
    && chmod +x /usr/bin/phpmd.phar

#install PHPMD bz2 php extension inorder to make phpmd run
RUN docker-php-ext-install bz2 \
    && rm -rf /var/cache/apk/*