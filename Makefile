DOCKER_COMPOSE = sudo docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
BASH = /bin/bash
CLEAR_FILE = ./srcs/.dev/clear_all.sh
VOLUME_PATH = /home/baubigna/data

all:	up
re:		restart
up:		up-back
up-front:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build
up-back:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build -d
stop:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop
clean:
		@make stop
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} down
dclean:
		@make stop
		@${BASH} ${CLEAR_FILE} || true
restart:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} stop || true
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build -d
drestart:
		@${BASH} ${CLEAR_FILE} || true
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up --build -d
create_volume:
		@sudo mkdir -p ${VOLUME_PATH}/wordpress ${VOLUME_PATH}/mariadb || true
destroy_volume:
		@sudo rm -rf ${VOLUME_PATH} || true
.PHONY:	all re up up-front up-back stop clean dclean restart drestart create_volume destroy_volume
