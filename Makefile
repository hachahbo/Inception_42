all:
	mkdir -p /home/${USER}/data/wp
	mkdir -p /home/${USER}/data/db
	@docker compose -f srcs/docker-compose.yml up -d --build

start:
	docker start $$(docker ps -a -q)

stop :
	docker stop $$(docker ps -q)

down:
	@docker compose -f srcs/docker-compose.yml down

re:
	@docker compose -f srcs/docker-compose.yml up -d --build

clean: down
	sudo rm -rf  /home/${USER}/data
	@docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\