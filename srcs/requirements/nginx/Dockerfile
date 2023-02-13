FROM	alpine:3.16

RUN	apk update && \
	apk upgrade && \
	apk add nginx && \
	apk add nginx openssl && \
	mkdir -p /etc/nginx/ssl && \
	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
		-out /etc/nginx/ssl/minslee.crt \
		-keyout /etc/nginx/ssl/minslee.key \
		-subj "/C=KR/ST=Seoul/L=Gangnam/O=42Seoul/OU=Gon/CN=minslee.42.fr/"

COPY	./requirements/nginx/conf/nginx.conf /etc/nginx/http.d/nginx.conf

EXPOSE	443

CMD	["nginx", "-g", "daemon off;"]
