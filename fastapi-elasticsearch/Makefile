.PHONY: help config build start stop restart run shell logs ps clean test
.DEFAULT_GOAL := help

include .env.local
-include .env

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

dc = docker compose -f compose.yml -f compose.$(ENV).yml

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

##@ Docker
config c: ## Validate and show Compose config
	$(dc) config

build b: ## Build application image
	$(dc) build

start s: ## Start services
	$(dc) up -d

stop st: ## Stop services
	$(dc) down -t0

restart r: stop start ## Restart services

run: ## Run a one-off app shell
	$(dc) run --rm --entrypoint $(DOCKER_SHELL) app

shell sh: ## Open a shell in the running app
	$(dc) exec app $(DOCKER_SHELL)

logs l: ## Follow logs
	$(dc) logs -f

ps: ## List services
	$(dc) ps -a

clean: ## Remove containers and volumes
	$(dc) down -t0 --volumes --remove-orphans

test: ## Run tests in the app container
	$(dc) exec -T app pytest -q test/
