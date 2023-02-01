/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "CREATE DATABASE ${DATABASE_NAME};"
mysql -uroot -e "CREATE USER '${ADMIN_USERNAME}'@'%' IDENTIFIED BY '${ADMIN_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${ADMIN_USERNAME}'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "CREATE USER '${USERNAME}'@'%' IDENTIFIED BY '${PASSWORD}'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${DATABASE_NAME}.* TO '${USERNAME}'@'%' WITH GRANT OPTION"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ADMIN_PASSWORD}';"

mysqladmin -uroot shutdown

touch ${DB_PATH}/.initialized_db
