FROM debian:buster

RUN apt -y update \
    && apt -y install mariadb-server \
    && apt -y install mariadb-client

COPY config/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY bin/setup_db.sh /usr/local/bin/setup_db.sh
COPY bin/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var /var/run /var/run/mysqld /run/mysqld /var/lib/mysql

ENTRYPOINT ["/bin/bash", "/usr/local/bin/entrypoint.sh"]
