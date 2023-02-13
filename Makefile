NAME = inception

all:
	@printf "Launch configuration ${name}...\n"
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

install:
	@printf "Download Docker...\n"
	@sudo apt install -y sudo docker docker-compose

down:
	@printf "Stopping configuration ${name}...\n"
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	@printf "Rebuild configuration ${name}...\n"
	@sudo docker-compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@sudo docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@sudo docker stop $$(docker ps -qa)
	@sudo docker system prune --all --force --volumes
	@sudo docker network prune --force
	@sudo docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean
