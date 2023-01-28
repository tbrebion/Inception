NAME 	= inception
COMPOSE = srcs/docker-compose.yml
VOLUMES = $(shell sudo docker volume ls -q)

VOLUME_PATH = /home/$(USER)/data
WP_VOLUME	= $(VOLUME_PATH)/wordpress
DB_VOLUME	= $(VOLUME_PATH)/mariadb

$(NAME):
		mkdir -p $(WP_VOLUME)
		mkdir -p $(DB_VOLUME)
		sudo docker compose $(COMPOSE) build up --build -d

re: fclean all

start: 
	sudo docker compose $(COMPOSE) up

stop:
	sudo docker compose $(COMPOSE) down

clean:
	stop
	sudo docker system prune -af

fclean:
	clean
	sudo rm -rf $(WP_VOLUME)
	sudo rm -rf $(DB_VOLUME)
	sudo mkdir -p $(WP_VOLUME)
	sudo mkdir -p $(DB_VOLUME)

.PHONY: all clean fclean	
