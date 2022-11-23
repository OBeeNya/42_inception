FROM debian:buster

RUN apt -y update \
    && apt install -y php \
    && apt install -y mariadb-client \
    && apt install -y php-fpm \
    && apt install -y php-mysql \
    && apt install -y curl

RUN mkdir -p /etc/local/wp-configuration /var/www/html

COPY ./config/* /etc/local/wp-configuration/
COPY ./bin/* /etc/local/wp-configuration/

WORKDIR /var/www/html

ENTRYPOINT [ "/bin/sh", "/etc/local/wp-configuration/entrypoint.sh" ]
