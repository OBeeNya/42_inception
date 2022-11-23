DOCKER_COMPOSE = sudo docker-compose
DOCKER_COMPOSE_FILE = srcs/docker-compose.yml
BASH = /bin/bash
CLEAR_FILE = ./srcs/.dev/clear_all.sh
VOLUME_PATH = /home/baubigna/data

all:	up
re:		restart
up:		up-back
up-front:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -b
up-back:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -bd
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
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -bd
drestart:
		@${BASH} ${CLEAR_FILE} || true
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} up -bd
create_volume:
		@sudo mkdir -p ${VOLUME_PATH}/wordpress ${VOLUME_PATH}/mariadb ${VOLUME_PATH}/nginx || true
destroy_volume:
		@sudo rm -rf ${VOLUME_PATH}/wordpress ${VOLUME_PATH}/mariadb ${VOLUME_PATH}/nginx || true
status:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} ps
logs:
		@${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_FILE} logs -t=100
.PHONY:	all re up up-front up-back stop clean dclean restart drestart create_volume destroy_volume status logs
