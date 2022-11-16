DOCKER_COMPOSE = sudo docker-compose
DOCKER_COMPOSE_YML = srcs/docker-compose.yml

all:
	sudo mkdir -p /home/baubigna/data/mariadb /home/baubigna/data/wordpress
	${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_YML} up -d

stop:	${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_YML} stop

clean:	make stop
	${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_YML} rm
	cd srcs && ${DOCKER_COMPOSE} down --volumes
	sudo rm -rf ~/data

fclean:
	cd srcs && docker-compose down -v && cd ..
	sudo sudo rm -rf ~/data

.PHONY:	all
