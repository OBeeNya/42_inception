RET=1
while [ $RET -ne 0 ]; do
    sleep 5
    mysqladmin -u ${USERNAME} -p${PASSWORD} -h mariadb ping > /dev/null 2>&1
    RET=$?
done

if [ ! -f ${WP_PATH}/.initialized_wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
    mv ${WP_LOCAL_PATH}/www.conf /etc/php/7.3/fpm/pool.d/
    bash ${WP_LOCAL_PATH}/setup-wp.sh
fi

exec "$@"