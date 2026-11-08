COMPOSE=docker compose -f docker-compose.dev.yml

.PHONY: build up down bundle-install

build:
	$(COMPOSE) build

up:
	$(COMPOSE) up

down:
	$(COMPOSE) down

bundle-install:
	$(COMPOSE) run --rm api bundle install