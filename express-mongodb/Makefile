#dev
config:
	docker-compose config
build:
	docker-compose build
push:
	docker-compose push
pull:
	docker-compose pull
start:
	docker-compose up -d
stop:
	docker-compose down
restart:
	docker-compose restart
run:
	docker-compose run --rm --entrypoint sh app
logs:
	docker-compose logs -f
ps:
	docker-compose ps
shell:
	docker-compose exec app sh
#prod
config.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml config
build.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml build
push.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml push
pull.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml pull
start.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml up -d
stop.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml stop
restart.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml restart
run.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml run --rm --entrypoint sh app
	