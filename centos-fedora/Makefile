.PHONY: help
.DEFAULT_GOAL := help

include .env
-include .env.local

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

dc_files = docker-compose.yml
dc = docker compose $(foreach f,$(dc_files),-f $(f))

export ENV
export TAG

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} \
	/^[a-zA-Z0-9_. -]+:.*##/ { \
		split($$1,a," "); \
		printf "%-20s %s\n", a[1], $$2 \
	} \
	/^##@/ {printf "\n%s\n", substr($$0,5)}' $(MAKEFILE_LIST)

##@ Docker
config c: ## Show config
	$(dc) config

build b: ## Build images
	$(dc) build

start s: ## Start containers
	$(dc) up -d

stop st: ## Stop containers
	$(dc) down -t0

restart r: stop start ## Restart

run: ## Run shell
	$(dc) run --rm --entrypoint $(DOCKER_SHELL) app

shell sh: ## Exec shell
	$(dc) exec app $(DOCKER_SHELL)

logs l: ## Follow logs
	$(dc) logs -f

ps: ## List containers
	$(dc) ps -a

clean cl: stop ## Cleanup docker
	docker system prune -fa && docker volume prune -fa

sh.master1: ## Exec shell master1
	$(dc) exec master1 bash

sh.node1: ## Exec shell node1
	$(dc) exec node1 bash

##@ Multipass
multipass.install: ## Install
	$(dc) exec master1 bash -c "yum install -y make; snap install multipass"
	$(dc) exec node1 bash -c "dnf install -y make; snap install multipass"

multipass.launch: ## Launch
	$(dc) exec master1 bash -c "make launch.master"
	$(dc) exec node1 bash -c "make launch.node"