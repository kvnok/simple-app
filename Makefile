COMPOSE=docker-compose -f docker-compose.yml

all: build up

up: 
	${COMPOSE} up -d

build:
	${COMPOSE} build

down:
	${COMPOSE} down

prune:
	docker system prune

clean:
	${COMPOSE} down -v --rmi all

fclean: clean prune

re: fclean all

.PHONY: all up build down prune clean fclean re
