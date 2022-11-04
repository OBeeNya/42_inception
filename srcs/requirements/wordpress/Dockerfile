FROM debian:buster

# Prerequisites
RUN apt update -y
RUN apt upgrade -y
RUN apt install wget -y

# PHP
RUN apt install -y php7.3 \
	php.fpm \
	php-mysql \
	mariadb-client

# Wordpress
RUN wget https://fr.wordpress.org/wordpress-6.1-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.1-fr_FR.tar.gz && rm wordpress-6.1-fr_FR.tar.gz

# Access rights
RUN chown -R root:root /var/www/wordpress

# Configuration
COPY conf/php.ini /etc/php/7.3/apache2/php.ini
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY conf/auto_config.sh /usr/local/bin/auto_config.sh

ENTRYPOINT ["/bin/bash", "/usr/local/bin/auto_config.sh"]
