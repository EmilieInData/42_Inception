all:
	mkdir -p $(HOME)/inception_data
	mkdir -p $(HOME)/inception_data/web
	mkdir -p $(HOME)/inception_data/web/ssl
	mkdir -p $(HOME)/inception_data/data
	docker compose -p "" -f ./sources/docker-compose.yml up --build -d

copy: 
	#copier le env automatiquement

up:
	docker compose -p "" -f ./sources/docker-compose.yml up -d

down:
	docker compose -p "" -f ./sources/docker-compose.yml down

clean:
	docker compose -p "" -f ./sources/docker-compose.yml down -v --rmi all

fclean: clean
	docker container prune
	docker system prune -a --volumes
	sudo rm -rf $(HOME)/inception_data

re: fclean all

.phony: all copy up down clean fclean re


