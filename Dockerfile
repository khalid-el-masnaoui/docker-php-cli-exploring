FROM php:8.2-cli

SHELL ["/bin/bash", "-c"]

RUN  apt-get update -y && apt-get install -y procps 

#ADD user www-data
RUN (id -u www-data &> /dev/null || useradd www-data) && (groups www-data | grep -qw www-data || (groupadd www-data &&  usermod -a -G www-data www-data))
#USER www-data


# Install PHP extensions deps
RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        libmcrypt-dev \
        zlib1g-dev \
        libicu-dev \
        g++ \
        unixodbc-dev \
        libxml2-dev \
        libaio-dev \
        libmemcached-dev \
        freetds-dev \
        libonig-dev \
        libfreetype-dev \
		libjpeg62-turbo-dev \
		libpng-dev \
	libssl-dev \
	libzip-dev \
	openssl \
	curl \
    wget \
        vim \
        git \
        unzip

# Install PHP extensions
RUN pecl install redis \
    && pecl install memcached \
    && pecl install mcrypt \
    && docker-php-ext-install \
            iconv \
            mbstring \
            intl \
            gd \
            mysqli \
            pdo_mysql \
            sockets \
            zip \
            pcntl \
            ftp \
            bcmath \
    && docker-php-ext-enable \
            mcrypt \
            redis \
            memcached \
            opcache


# Install Composer
#traditional
#RUN curl -sS https://getcomposer.org/installer | php -- \
#        --install-dir=/usr/local/bin \
#        --filename=composer

#using multistage 
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

#add apcu
RUN pecl install apcu \
  && docker-php-ext-enable apcu


RUN mkdir /dockerBuild

#COPY ./src/ /dockerBuild/

WORKDIR /dockerBuild

CMD [ "php", "./index.php" ]

#Define mountable directories.
VOLUME ["/dockerBuild"]
