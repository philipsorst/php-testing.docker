FROM ubuntu:16.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

# Add PPA for PHP 7.x
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

# Install packages
RUN apt-get update \
    && apt-get install -qy \
        php7.1 \
        php7.1-fpm \
        php7.1-dev \
        php7.1-cli \
        php7.1-common \
        php7.1-intl \
        php7.1-bcmath \
        php7.1-mbstring \
        php7.1-soap \
        php7.1-xml \
        php7.1-zip \
        php7.1-apcu \
        php7.1-json \
        php7.1-gd \
        php7.1-curl \
        php7.1-mcrypt \
        php7.1-mysql \
        php7.1-sqlite \
        php-memcached \
        composer \
        npm

# Update NodeJs
RUN npm cache clean -f && npm install -g n && n 8.9 && npm install -g npm