FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get -y install wget

RUN apt-get install -y php7.3
RUN	apt-get install -y php-cgi
RUN	apt-get install -y php-mysql
RUN	apt-get install -y php-fpm
RUN	apt-get install -y mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www \
RUN	tar -xzf wordpress-6.0-fr_FR.tar.gz \
RUN	rm wordpress-6.0-fr_FR.tar.gz \
RUN	chown -R root:root /var/www/wordpress

RUN mkdir -p /var/run/php/

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root --locale=en_US --path=/var/www/wordpress

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY ./tools/auto_config.sh /tmp/auto_config.sh

EXPOSE 9000

WORKDIR /var/www/html/

ENTRYPOINT [ "bash", "/tmp/auto_config.sh" ]



# CMD ["/usr/sbin/php-fpm7.3", "-F"]