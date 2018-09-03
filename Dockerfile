FROM ubuntu:16.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

# Add PPA for PHP 7.x
RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-php.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

# Install packages
RUN apt-get update \
    && apt-get install -qy \
        php7.2 \
        php7.2-fpm \
        php7.2-dev \
        php7.2-cli \
        php7.2-common \
        php7.2-intl \
        php7.2-bcmath \
        php7.2-mbstring \
        php7.2-soap \
        php7.2-xml \
        php7.2-zip \
        php7.2-apcu \
        php7.2-json \
        php7.2-gd \
        php7.2-curl \
        php7.2-mcrypt \
        php7.2-mysql \
        php7.2-sqlite \
        php-memcached \
        composer \
        npm

# Update NodeJs
RUN npm cache clean -f && npm install -g n && n 8.9 && npm install -g npm