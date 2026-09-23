.PHONY: help
.DEFAULT_GOAL := help

-include .env
include .env.local

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

dc_files = compose.yml -f compose.$(ENV).yml

dc = docker compose $(foreach f,$(dc_files),-f $(f))
dbb = docker buildx bake $(foreach f,$(dc_files),-f $(f))

export GITHUB_TOKEN

help h: ## Show help
@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

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

clean: ## Remove containers and volumes
	$(dc) down -t0 --volumes --remove-orphans

##@ Github CR
login: ## Login
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u GITHUB_USERNAME --password-stdin

##@ Docker buildx
buildx.create: ## Create
	docker buildx create --name mybuilder\
	&& docker buildx use mybuilder
buildx.inspect: ## Inspect
	docker buildx inspect mybuilder
buildx.ls: ## List
	docker buildx ls
buildx.rm: ## Remove
	docker buildx rm mybuilder\
	&& docker buildx prune -af

##@ Docker buildx bake
buildx.bake.print: ## Print
	${dbb} --print
buildx.bake: ## Bake
	${dbb}
buildx.bake.load: ## Load
	${dbb} --load
buildx.bake.push: ## Push
	${dbb} app --push
publish: build push ## Publish (build, push)
	make buildx.create\
	&& make buildx.bake.push\
	&& make buildx.rm