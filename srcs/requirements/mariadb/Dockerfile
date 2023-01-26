FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh /etc/mysql/tools/mariadb.sh

ENTRYPOINT [ "bash", "/etc/mysql/tools/mariadb.sh" ]
