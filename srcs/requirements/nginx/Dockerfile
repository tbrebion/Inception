FROM debian:buster

RUN apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install nginx -y \
	&& apt-get install vim -y \
	&& apt-get install curl -y \
	&& mkdir -p /etc/nginx/ssl \
	&& apt-get install OpenSSL -y \
	&& openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=tbrebion.42.fr/UID=tbrebion" \
	&& mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 775 /var/www/html \
	&& chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]
