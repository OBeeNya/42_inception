sleep 10
wp config create --allow-root \
	--dbname=$SQL_DATABASE \
	--dbuser=$SQL_USER \
	--dbpass=$SQL_PASSWORD \
	--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install --allow-root --url=$DOMAIN_NAME --title=supervisor --admin_user=baubigna --admin_password=$ADMIN_PWD --admin_email=baubigna@42.fr
wp user create --allow-root ben ben@42.fr --role=author
mkdir -p /run/php
exec /usr/sbin/php-fpm7.3 -F
