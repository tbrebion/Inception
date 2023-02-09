FROM debian:buster

RUN apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld
RUN	chown -R mysql:mysql /var/run/mysqld
RUN	chmod -R 755 /var/run/mysqld

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /etc/mysql/tools/mariadb.sh

EXPOSE 3306

ENTRYPOINT [ "bash", "/etc/mysql/tools/mariadb.sh" ]
