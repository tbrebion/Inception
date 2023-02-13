
VOLUME_PATH = /home/$(USER)/data
WP_VOLUME	= $(VOLUME_PATH)/wordpress
DB_VOLUME	= $(VOLUME_PATH)/mariadb

all:
	mkdir -p $(WP_VOLUME)
	mkdir -p $(DB_VOLUME)
	docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml down

re:
	mkdir -p $(WP_VOLUME)
	mkdir -p $(DB_VOLUME)
	docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	down
	sudo docker system prune -af

fclean:
	clean
	sudo rm -rf $(WP_VOLUME)
	sudo rm -rf $(DB_VOLUME)
	sudo mkdir -p $(WP_VOLUME)
	sudo mkdir -p $(DB_VOLUME)

.PHONY: all re down clean fclean
