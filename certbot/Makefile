.PHONY: help config build start stop restart run shell logs ps clean
.DEFAULT_GOAL := help

include .env.local
-include .env

export

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

dc_certbot = docker compose -f compose.certbot.yml
dc = docker compose -f compose.$(ENV).yml

CERTONLY=certonly -n --agree-tos -m $$EMAIL --dns-route53 -d $$DOMAINS

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

##@ Docker
config c: ## Show config
	$(dc) config

build b: ## Build images
	$(dc) build

start s: ## Start containers
	$(MAKE) start.nginx
start.nginx: ## Start containers
	$(dc) up -d nginx
start.httpd: ## Start containers
	$(dc) up -d httpd

stop st: ## Stop containers
	$(dc) down -t0

restart r: stop start ## Restart

run: ## Run shell
	$(MAKE) run.nginx
run.nginx: ## Run shell
	$(dc) run --rm --entrypoint ${DOCKER_SHELL} nginx
run.httpd: ## Run shell
	$(dc) run --rm --entrypoint ${DOCKER_SHELL} httpd

shell sh: ## Exec shell
	$(dc) exec app $(DOCKER_SHELL)

logs l: ## Follow logs
	$(dc) logs -f

ps: ## List containers
	$(dc) ps -a

clean: ## Remove containers and volumes
	$(dc) down -t0 --volumes --remove-orphans

##@ Cerbot
certbot.dry.run cdr: ## Dry run cerbot
	$(dc_certbot) run --rm certbot ${CERTONLY} --dry-run

certbot.run cr: ## Run cerbot
	$(dc_certbot) run --rm certbot ${CERTONLY}
