FROM ubuntu:20.04
MAINTAINER Philip Washington Sorst <philip@sorst.net>

RUN echo "Europe/Berlin" > /etc/timezone \
    && ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && apt update \
    && apt install -qy --no-install-recommends \
        curl \
        rsync \
        gnupg \
        openssh-client \
        git \
        unzip \
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
        librsvg2-bin \
        fonts-ubuntu \
        npm \
    && echo "zend.assertions=1" >> /etc/php/7.4/mods-available/assertions.ini \
    && echo "assert.exception=1" >> /etc/php/7.4/mods-available/assertions.ini \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && phpenmod assertions \
    && npm install -g yarn \
    && npm cache clean -f \
    && apt-get clean
