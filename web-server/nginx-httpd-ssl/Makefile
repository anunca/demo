.PHONY: help
.DEFAULT_GOAL := help

-include .env
include .env.local

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

dc = docker compose -f compose.$(ENV).yml

export NGINX_IMAGE APACHE_IMAGE PHP_IMAGE IMAGE DOMAIN_NAME_SSL

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
	$(dc) run --rm --entrypoint $(DOCKER_SHELL) proxy

shell sh: ## Exec shell
	$(dc) exec proxy $(DOCKER_SHELL)

logs l: ## Follow logs
	$(dc) logs -f

ps: ## List containers
	$(dc) ps -a

clean: ## Remove containers and volumes
	$(dc) down -t0 --volumes --remove-orphans

sh.app: ## Get into www container
	$(dc) exec app sh
certs: ## Create certificate
	bash sh/create_certificate.sh ${DOMAIN_NAME_SSL}
certs.view:
	openssl x509 -text -noout -in certs/${DOMAIN_NAME_SSL}.crt
certs.macOS.create: certs.macOS.delete
	security add-trusted-cert -d -r trustRoot -p ssl -k /Library/Keychains/System.keychain certs/ca.${DOMAIN_NAME_SSL}.pem
	security add-trusted-cert -d -r trustAsRoot -p ssl -k /Library/Keychains/System.keychain certs/${DOMAIN_NAME_SSL}.crt
certs.macOS.delete:
	security find-certificate -c "${DOMAIN_NAME_SSL}" -a -Z | awk '/SHA-1/{system("security delete-certificate -Z "$$NF)}'
