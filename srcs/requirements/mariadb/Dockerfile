FROM debian:buster

RUN apt-get update -y
RUN	apt-get upgrade -y
RUN	apt-get install mariadb-server -y
RUN	apt-get install mariadb-client -y
RUN apt install sudo -y
RUN apt install systemd -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/mariadb.sh /etc/mysql/tools/mariadb.sh

EXPOSE 3306

RUN mkdir -p /var/run/mysqld
RUN	chown -R mysql:mysql /var/run/mysqld
RUN	chmod -R 755 /var/run/mysqld

RUN chmod +x /etc/mysql/tools/mariadb.sh


ENTRYPOINT [ "bash", "/etc/mysql/tools/mariadb.sh" ]
