FROM debian:buster

# Nginx
RUN apt update -y
RUN apt upgrade -y
RUN apt install nginx -y

# OpenSSL
RUN apt install openssl -y
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/0=42/OU=42/CN=baubigna/CN=baubigna.42.fr/UID=baubigna"

# Config
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Getting access rights to server root
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# Don't run the program in the background
CMD ["nginx", "-g", "daemon off;"]
