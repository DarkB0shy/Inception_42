all:
	apt update -y && apt upgrade -y
	apt install -y git docker docker.io docker-compose
	service docker restart
	mkdir -p /home/dcarassi/data/volume_mariadb
	mkdir -p /home/dcarassi/data/volume_wordpress
	sh -c -e "echo '127.0.0.1 dcarassi.42.fr' >> /etc/hosts";
	docker-compose -f srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f srcs/docker-compose.yml down
	docker system prune -af
	docker network prune -f

fclean: clean
	docker volume remove srcs_volume_mariadb srcs_volume_wordpress
	rm -rf /home/dcarassi/data/volume_mariadb
	rm -rf /home/dcarassi/data/volume_wordpress
	sed -i '/dcarassi.42.fr/d' /etc/hosts

re: fclean all clean
