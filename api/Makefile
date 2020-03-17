project.app.connect:
	docker-compose run --rm app sh
project.db.connect:
	docker-compose run --rm db ls
project.add.global:
	docker-compose run --rm app sh -c "yarn global add serverless"
project.init:
	docker-compose run --rm app sh -c "sls"
project.add:
	docker-compose run --rm app sh -c "yarn add aws-sdk"
	docker-compose run --rm app sh -c "yarn add uuid"
	docker-compose run --rm app sh -c "yarn add -D serverless-offline"
project.test:
	docker-compose run --rm app sh -c "sls print"
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