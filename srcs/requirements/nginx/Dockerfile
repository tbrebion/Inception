FROM debian:buster

RUN apt-get -y update \
	&& apt-get -y install nginx openssl \
	&& mkdir -p /etc/nginx/ssl \
	&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/tbrebion.crt \
		-keyout /etc/nginx/ssl/tbrebion.key \
		-subj "/C=FR/L=Paris/O=42/CN=tbrebion.42.fr/UID=tbrebion"

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
