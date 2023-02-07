#!/bin/bash

if [ -f "/var/www/wordpress/.is_wp_installed" ]

then
	echo "Wordpress is already installed"

else
	sleep 5
	wp config create --allow-root \
				--dbname=$SQL_DATABASE \
				--dbuser=$SQL_USER \
				--dbpass=$SQL_PASSWORD \
				--dbhost=mariadb:3306 --path=/var/www/wordpress

	wp core install --path=/var/www/wordpress \
				--url=https://${DOMAIN_NAME} \
				--title=Inception \
				--admin_user=${WP_ADMIN_USER} \
				--admin_password=${WP_ADMIN_PASS} \
				--admin_email=${WP_ADMIN_EMAIL} \
				--skip-email \
				--allow-root

	echo "Adding another user"

	wp user create ${WP_USER} ${WP_EMAIL} \
				--role=author \
				--path=/var/www/wordpress \
				--user_pass=${WP_PASS} \
				--display_name=${WP_USER} \
				--first_name=${WP_USER_FIRST_NAME} \
				--last_name=${WP_USER_LAST_NAME} \
				--allow-root

	touch /var/www/wordpress/.is_wp_installed

fi

exec "/usr/sbin/php-fpm7.3 -F"
