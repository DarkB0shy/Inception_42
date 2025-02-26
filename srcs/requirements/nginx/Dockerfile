FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/nginx/ssl/chiave_ssl.key \
    -out /etc/nginx/ssl/certificato_ssl.crt \
    -subj "/C=IT/L=RM/O=42_Roma/OU=dcarassi/CN=dcarassi"

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
