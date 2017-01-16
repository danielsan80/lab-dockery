FROM ubuntu:14.04


ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get install -y \
    git \
    curl \
    php5-cli \
    php5-json \
    php5-intl

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

COPY entrypoint.sh /entrypoint.sh
COPY . /var/www

WORKDIR /var/www

EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]
