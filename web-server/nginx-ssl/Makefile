.PHONY: help
.DEFAULT_GOAL := help

-include .env
include .env.local

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

dc = docker compose -f compose.$(ENV).yml

export APP_DOMAIN_NAME

SUBJECT="/C=FR/ST=Ile-de-France/L=Paris/O=MyCompany/OU=MyOrganizationUnit/CN=${APP_DOMAIN_NAME}"

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

clean.all ca: stop ## Cleanup all docker
	docker system prune -fa && docker volume prune -fa

# ssc.create: ssc.delete ## Self signed certificate create
# 	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "${SUBJECT}" -out etc/nginx/ssl/${APP_DOMAIN_NAME}.crt -keyout etc/nginx/ssl/${APP_DOMAIN_NAME}.key\
# 	&& chmod +r etc/nginx/ssl/${APP_DOMAIN_NAME}.key
# ssc.delete: ## Self signed certificate delete
# 	rm -f etc/nginx/ssl/{${APP_DOMAIN_NAME}.key,${APP_DOMAIN_NAME}.crt}
ssc.create: ## Self signed certificate create
	bash sh/self_signed_certificate_create.sh ${APP_DOMAIN_NAME}
ssc.check:
	openssl verify -CAfile etc/nginx/ssl/CA-${APP_DOMAIN_NAME}.pem -verbose etc/nginx/ssl/${APP_DOMAIN_NAME}.crt
ssc.view:
	openssl x509 -text -noout -in etc/nginx/ssl/${APP_DOMAIN_NAME}.crt
ssc.macos.add: ssc.macos.remove ## Add self signed certificate for macOS to Keychain
	security add-trusted-cert -d -r trustRoot -p ssl -k /Library/Keychains/System.keychain etc/nginx/ssl/CA-${APP_DOMAIN_NAME}.pem
	security add-trusted-cert -d -r trustAsRoot -p ssl -k /Library/Keychains/System.keychain etc/nginx/ssl/${APP_DOMAIN_NAME}.crt
ssc.macos.remove: ## Remove self signed certificate for macOS from Keychain
	security find-certificate -c "${APP_DOMAIN_NAME}" -a -Z | awk '/SHA-1/{system("security delete-certificate -Z "$$NF)}'