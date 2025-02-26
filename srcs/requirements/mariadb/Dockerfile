FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY conf/mariadb_conf.sh mariadb_conf.sh
CMD ["sh", "mariadb_conf.sh"]
