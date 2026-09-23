.PHONY: help config build start stop restart run shell logs ps clean
.DEFAULT_GOAL := help

-include .env
-include .env.local

ENV ?= dev
DOCKER_SHELL ?= sh

dc = docker compose -f compose.$(ENV).yml

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

config c: ## Validate and show Compose config
	$(dc) config
build b: ## Build images
	$(dc) build
start s: ## Start services
	$(dc) up -d --build
stop st: ## Stop services
	$(dc) down
restart r: stop start ## Restart services
run: ## Run one-off app shell
	$(dc) run --rm --entrypoint $(DOCKER_SHELL) app
shell sh: ## Open app shell
	$(dc) exec app $(DOCKER_SHELL)
logs l: ## Follow logs
	$(dc) logs -f
ps: ## List services
	$(dc) ps
clean: ## Remove this lab's containers, networks, and volumes
	$(dc) down --volumes --remove-orphans
