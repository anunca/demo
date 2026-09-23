.PHONY: help config start stop restart shell logs ps clean
.DEFAULT_GOAL := help

include .env.local
-include .env

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh
dc = docker compose -f compose.$(ENV).yml

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

config c: ## Validate and show Compose config
	$(dc) config
start s: ## Start services
	$(dc) up -d
stop st: ## Stop services
	$(dc) down -t0
restart r: stop start ## Restart services
shell sh: ## Open Traefik shell
	$(dc) exec traefik $(DOCKER_SHELL)
logs l: ## Follow logs
	$(dc) logs -f
ps: ## List services
	$(dc) ps
clean: ## Remove this lab's containers and networks
	$(dc) down --remove-orphans
