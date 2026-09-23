.PHONY: help
.DEFAULT_GOAL := help

include .env.local
-include .env

export

ENV ?= dev
TAG ?= ${ENV}
DOCKER_SHELL ?= sh

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

login: ## GCR
	echo ${GITHUB_TOKEN} | docker login ghcr.io -u GITHUB_USERNAME --password-stdin

kubectl.create.secret: #K8S
	kubectl create secret docker-registry ghcr-secret \
    --docker-server=ghcr.io \
    --docker-username=GITHUB_USERNAME \
    --docker-password=${GITHUB_TOKEN} \
    --docker-email=YOUR_EMAIL \
		--namespace default

argocd.install: ## ArgoCD install
	kubectl create namespace argocd
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

argocd.ps: ## ArgoCD ps
	kubectl -n argocd get all

argocd.forward: ## ArgoCD forward
	kubectl port-forward svc/argocd-server -n argocd 8080:443

argocd.password: ## ArgoCD password
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

argocd.apply: ## ArgoCD apply
	kubectl apply -f argo/nginx-app.yml