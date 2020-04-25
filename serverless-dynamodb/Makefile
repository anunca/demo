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
credential:
	docker-compose exec app sh -c "sls config credentials -o --profile default --provider aws --key ${AWS_ACCESS_KEY_ID} --secret ${AWS_SECRET_ACCESS_KEY}"
print:
	docker-compose exec app sh -c "sls print"
invoke:
	docker-compose exec app sh -c "sls invoke local -f hello"
package:
	docker-compose exec app sh -c "sls package"
doc:
	docker-compose exec app sh -c "sls openapi generate -o doc/swagger.yml -f yaml"
db.connect:
	docker-compose run --rm --entrypoint bash db
db.create:
	sh ./sh/ddb_create.sh
db.delete:
	sh ./sh/ddb_delete.sh
db.describe:
	sh ./sh/ddb_describe.sh
db.start:
	docker-compose up -d db
db.stop:
	docker-compose stop db && docker-compose rm -f db
db.restart:
	make stop.db && make start.db
