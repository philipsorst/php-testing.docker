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
    php7.3-cli \
	php7.3-xml \
	php7.3-sqlite3 \
	php7.3-mysql \
	php7.3-zip \
	php7.3-mbstring \
	php7.3-curl \
	php7.3-gd \
	php7.3-intl \
	php7.3-redis \
	composer \
	librsvg2-bin \
	fonts-ubuntu \
	npm

# Install deployer
RUN curl -L https://deployer.org/deployer.phar > /usr/local/bin/deployer && chmod +x /usr/local/bin/deployer

# Update node and install yarn
RUN npm cache clean -f && npm install -g n && n lts && npm install -g npm && npm install -g yarn

# Cleanup
RUN apt-get clean
