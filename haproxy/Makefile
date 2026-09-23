.PHONY: help
.DEFAULT_GOAL := help

include .env.local
-include .env

export

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh
APP_DOMAIN_NAME=appdemo.name
SUBJECT="/C=FR/ST=Ile-de-France/L=Paris/O=MyCompany/OU=MyOrganizationUnit/CN=${APP_DOMAIN_NAME}"

dc = docker compose -f compose.yml -f compose.$(ENV).yml

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

ssc.create: ssc.delete ## Self signed certificate create
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "${SUBJECT}" -keyout etc/nginx/certs/${APP_DOMAIN_NAME}.key -out etc/nginx/certs/${APP_DOMAIN_NAME}.crt\
	&& cat etc/nginx/certs/{${APP_DOMAIN_NAME}.key,${APP_DOMAIN_NAME}.crt} > etc/nginx/certs/${APP_DOMAIN_NAME}.pem\
	&& chmod +x etc/nginx/certs/${APP_DOMAIN_NAME}.pem

ssc.delete: ## Self signed certificate delete
	rm -f etc/nginx/certs/{${APP_DOMAIN_NAME}.key,${APP_DOMAIN_NAME}.crt}

ssc.view: ## Self signed certificate view
	openssl x509 -text -noout -in etc/nginx/certs/${APP_DOMAIN_NAME}.crt