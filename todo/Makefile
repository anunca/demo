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
build.prod:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml build
push.prod:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml push
pull.prod:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml pull
start.prod:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml up -d
stop.prod:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml down