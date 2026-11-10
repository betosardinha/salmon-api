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

migration:
	$(COMPOSE) run --rm api bundle exec rails g migration $(name)

migrate:
	$(COMPOSE) run --rm api bundle exec rails db:migrate

rollback:
	$(COMPOSE) run --rm api bundle exec rails db:rollback

console:
	$(COMPOSE) run --rm api bundle exec rails c