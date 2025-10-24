all:
	mkdir -p ~/data
	mkdir -p ~/data/web
	mkdir -p ~/data/database
	docker compose -p "" -f ./sources/docker-compose.yml up --build -d

up:
	docker compose -p "" -f ./sources/docker-compose.yml up -d

down:
	docker compose -p "" -f ./sources/docker-compose.yml down

clean:
	docker compose -p "" -f ./sources/docker-compose.yml down -v --rmi all

fclean: clean
	docker container prune
	docker system prune -a --volumes
	sudo rm -rf ~/data

re: fclean all

.phony: all up down clean fclean re


