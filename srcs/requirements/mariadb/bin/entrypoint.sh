chmod 644 /etc/mysql/mariadb.conf.d/*.cnf

if [[ ! -f ${DP_PATH}/.initialized_db ]]; then
    bash /usr/local/bin/setup_db.sh
fi

exec "$@"
