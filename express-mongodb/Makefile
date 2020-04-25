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
build.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml build
push.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml push
pull.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml pull
start.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml up -d
stop.p:
	docker-compose -f docker-compose.override.yml -f docker-compose.prod.yml down
	