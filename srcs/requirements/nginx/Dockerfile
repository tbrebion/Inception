FROM debian:buster

RUN apt-get update -y
RUN	apt-get upgrade -y

RUN	apt-get install nginx -y

RUN	apt-get install vim -y
RUN	apt-get install curl -y
RUN	mkdir -p /etc/nginx/ssl
RUN	apt-get install openssl -y
RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=tbrebion.42.fr/UID=tbrebion" \
	&& mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 777 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]
