FROM php:8-apache

ARG SOFTWARENAME_VER="1.0.0"

LABEL base.image="php:8-apache"
LABEL dockerfile.version="1"
LABEL software="Apache PHP8"
LABEL software.version="${SOFTWARENAME_VER}"
LABEL description="Apache Webserver with PHP8"
LABEL website="https://github.com/NightMeer/ApachePHP8"
LABEL license=""
LABEL maintainer="NightMeer"
LABEL maintainer.email="git@nightmeer.de"
#Github Related
LABEL org.opencontainers.image.source="https://github.com/NightMeer/ApachePHP8" 

VOLUME ["/config"]
VOLUME ["/var/www/html"]

EXPOSE 80

WORKDIR /var/www/html

RUN apt-get update && apt-get upgrade -y  \
    && apt-get install -y rsync sendmail libfreetype-dev libjpeg62-turbo-dev libpng-dev libicu-dev zip libzip-dev libpq-dev libgmp-dev\
    && docker-php-ext-configure intl && docker-php-ext-install intl \
    && docker-php-ext-configure pcntl && docker-php-ext-install pcntl \
    && docker-php-ext-configure pdo  && docker-php-ext-install pdo \
    && docker-php-ext-configure mysqli && docker-php-ext-install mysqli \
    && docker-php-ext-configure pdo_mysql  && docker-php-ext-install pdo_mysql \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && docker-php-ext-install pgsql \
    && docker-php-ext-configure pdo_pgsql && docker-php-ext-install pdo_pgsql \
    && docker-php-ext-configure gd --with-freetype --with-jpeg && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-configure zip && docker-php-ext-install zip \
    && docker-php-ext-configure gmp && docker-php-ext-install gmp \
    && a2enmod rewrite

COPY ./startup.sh /startup.sh
RUN chmod 777 /startup.sh

ENTRYPOINT ["/bin/sh"]
CMD ["-c","/startup.sh"]
