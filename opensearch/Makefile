.PHONY: help config start stop restart logs ps clean
.DEFAULT_GOAL := help

include .env.local
-include .env

ENV ?= dev
dc = docker compose -f compose.$(ENV).yml

export OPENSEARCH_INITIAL_ADMIN_PASSWORD

help h: ## Show help
	@awk 'BEGIN {FS = ":.*##"} /^[a-zA-Z0-9_. -]+:.*##/ {split($$1,a," "); printf "%-20s %s\n",a[1],$$2}' $(MAKEFILE_LIST)

config c: ## Validate and show Compose config
	$(dc) config
start s: ## Start OpenSearch stack
	@test -n "$(OPENSEARCH_INITIAL_ADMIN_PASSWORD)" || (echo "OPENSEARCH_INITIAL_ADMIN_PASSWORD is required" >&2; exit 1)
	$(dc) up -d
stop st: ## Stop services
	$(dc) down
restart r: stop start ## Restart services
logs l: ## Follow logs
	$(dc) logs -f
ps: ## List services
	$(dc) ps
clean: ## Remove this lab's containers, networks, and volumes
	$(dc) down --volumes --remove-orphans
