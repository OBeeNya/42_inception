FROM debian:buster

# MariaDB
RUN apt update -y
RUN apt upgrade -y
RUN apt install mariadb-server -y

# Config
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/setup.sh /usr/local/bin/setup.sh
ENTRYPOINT ["/bin/bash", "/usr/local/bin/setup.sh"]
