FROM php:8.2-cli

SHELL ["/bin/bash", "-c"]

RUN  apt-get update -y && apt-get install -y procps 

#ADD user www-data
RUN (id -u www-data &> /dev/null || useradd www-data) && (groups www-data | grep -qw www-data || (groupadd www-data &&  usermod -a -G www-data www-data))
#USER www-data

ARG PHP_VER
ENV PHP_VER=$PHP_VER

RUN mkdir /dockerBuild

#COPY ./src/ /dockerBuild/

WORKDIR /dockerBuild

CMD [ "php", "./index.php" ]

#Define mountable directories.
VOLUME ["/dockerBuild"]
