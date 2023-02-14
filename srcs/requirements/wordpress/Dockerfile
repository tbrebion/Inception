FROM debian:buster

RUN apt-get update -y \
    && apt-get upgrade -y \
	&& apt-get -y install wget \
	&& apt install nano -y \
	&& apt install net-tools

RUN apt-get install -y php7.3 \
	php-fpm \
	php-mysql \
	php-mysqli

RUN	mkdir -p /var/run/php/ \
	&& mkdir -p /var/www/wordpress \
	&& chown -R root:root /var/www/wordpress

RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp \
	&& wp core download --allow-root --locale=en_US --path=/var/www/wordpress

COPY /conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY /conf/wp-config.php /var/www/wordpress/wp-config.php

COPY /tools/auto_config.sh /tmp/auto_config.sh

EXPOSE 9000

ENTRYPOINT [ "sh", "/tmp/auto_config.sh" ]
