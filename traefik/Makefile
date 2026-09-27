.PHONY: help config build start stop restart run shell logs ps clean
.DEFAULT_GOAL := help

include .env.local
-include .env

export

ENV ?= dev
DOCKER_SHELL ?= bash

dc = docker compose -f compose.$(ENV).yml

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

config c: ## Validate and show Compose config
	$(dc) config
build b: ## Build images
	$(dc) build
start s: ## Start services
	$(dc) up -d
stop st: ## Stop services
	$(dc) down -t0
restart r: stop start ## Restart services
run: ## Run shell
	$(dc) run --rm --entrypoint $(DOCKER_SHELL) traefik
shell sh: ## Open Traefik shell
	$(dc) exec traefik $(DOCKER_SHELL)
logs l: ## Follow logs
	$(dc) logs -f
ps: ## List services
	$(dc) ps -a
clean: ## Remove this lab's containers and networks
	$(dc) down --remove-orphans
