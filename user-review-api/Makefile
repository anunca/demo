app.connect:
	docker-compose exec app sh
run.connect:
	docker-compose run --rm --entrypoint sh app
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
credential:
	docker-compose exec app sh -c "sls config credentials -o --profile default --provider aws --key YOUR_AWS_ACCESS_KEY_ID --secret YOUR_AWS_SECRET_ACCESS_KEY"
print:
	docker-compose exec app sh -c "sls print -s dev"
package:
	docker-compose exec app sh -c "sls package -s dev"
remove:
	docker-compose exec app sh -c "sls remove -s dev"
config:
	docker-compose config
build:
	docker-compose build
start:
	docker-compose up -d
stop:
	docker-compose down
restart:
	make stop && make start
logs:
	docker-compose logs -f
ps:
	docker-compose ps