FROM ubuntu:18.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

#Set Timezone
RUN echo "Europe/Berlin" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Update
RUN apt-get update

# Install packages
RUN apt-get install -qy \
        php7.2-cli \
	php7.2-xml \
	php7.2-sqlite3 \
	php7.2-zip \
	php7.2-mbstring \
	composer \
	npm
#        php7.1-fpm \
#        php7.1-dev \
#        php7.1-cli \
#        php7.1-common \
#        php7.1-intl \
#        php7.1-bcmath \
#        php7.1-mbstring \
#        php7.1-soap \
#        php7.1-xml \
#        php7.1-zip \
#        php7.1-apcu \
#        php7.1-json \
#        php7.1-gd \
#        php7.1-curl \
#        php7.1-mcrypt \
#        php7.1-mysql \
#        php7.1-sqlite \
#        php-memcached \

# Install yarn
RUN npm -g install yarn

# Cleanup
RUN apt-get clean
