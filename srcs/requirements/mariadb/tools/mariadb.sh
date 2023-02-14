#!/bin/bash

if [ -f "/var/lib/mysql/.already_init" ]; then
	echo "Database is already initialized."
else	
	service mysql start;

	sleep 5

	mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
	mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
	mysql -u "$MYSQL" -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"
	mysqladmin -uroot -p"$SQL_ROOT_PASSWORD" shutdown
	touch /var/lib/mysql/.already_init

fi

exec mysqld
