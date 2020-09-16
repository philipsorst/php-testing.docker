FROM ubuntu:20.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

#Set Timezone
RUN echo "Europe/Berlin" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Prepare System and add additional sources
RUN apt update && \
    apt install -qy \
    curl \
    rsync \
    gnupg

# Install packages
RUN apt-get install -qy \
    php7.4-cli \
	php7.4-xml \
	php7.4-sqlite3 \
	php7.4-mysql \
	php7.4-zip \
	php7.4-mbstring \
	php7.4-curl \
	php7.4-gd \
	php7.4-intl \
	php7.4-redis \
	php7.4-pcov \
	composer \
	librsvg2-bin \
	fonts-ubuntu \
	npm \
    && echo "zend.assertions=1" >> /etc/php/7.4/mods-available/assertions.ini \
    && echo "assert.exception=1" >> /etc/php/7.4/mods-available/assertions.ini \
    && phpenmod assertions

# Update node and install yarn
RUN npm install -g yarn \
    && npm cache clean -f

# Cleanup
RUN apt-get clean
