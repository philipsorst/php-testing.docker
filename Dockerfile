FROM ubuntu:18.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

#Set Timezone
RUN echo "Europe/Berlin" > /etc/timezone
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Prepare System and add additional sources
RUN apt-get update && \
    apt-get install -qy \
    curl \
    rsync \
    gnupg && \
    echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main" > /etc/apt/sources.list.d/ondrej-php.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C && \
    apt-get update

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
	composer \
	librsvg2-bin \
	fonts-ubuntu \
	npm \
    && echo "zend.assertions=1" >> /etc/php/7.4/mods-available/assertions.ini \
    && echo "assert.exception=1" >> /etc/php/7.4/mods-available/assertions.ini \
    && phpenmod assertions

# Install deployer
RUN curl -L https://deployer.org/deployer.phar > /usr/local/bin/deployer && chmod +x /usr/local/bin/deployer

# Update node and install yarn
RUN npm cache clean -f && npm install -g n && n lts && npm install -g npm && npm install -g yarn

# Cleanup
RUN apt-get clean
