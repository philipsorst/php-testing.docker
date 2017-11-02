FROM ubuntu:16.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

# add PPA for PHP 7
	RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main" > /etc/apt/sources.list.d/ondrej-ubuntu-php-xenial.list
	RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C

# install packages
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
