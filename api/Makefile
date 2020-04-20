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
ps:
	docker-compose ps
logs:
	docker-compose logs -f
shell:
	docker-compose exec app sh
p.print:
	docker-compose exec app sh -c "sls print"
p.doc:
	docker-compose exec app sh -c "sls openapi generate -o doc/swagger.yml -f yaml"