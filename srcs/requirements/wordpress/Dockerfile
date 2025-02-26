FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y php7.3 php7.3-fpm php7.3-mysql curl

COPY conf/www.conf /etc/php/7.3/fpm/pool.d
COPY conf/wordpress_conf.sh /tmp/wordpress/
RUN mkdir -p /run/php ;\
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar ;\
chmod +x wp-cli.phar ; mv wp-cli.phar /usr/local/bin/wp
WORKDIR /var/www/html/wordpress
RUN wp core download --allow-root ; chown -R www-data:www-data /var/www/html/wordpress/

CMD ["sh", "/tmp/wordpress/wordpress_conf.sh"]
