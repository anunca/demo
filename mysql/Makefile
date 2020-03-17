config:
	docker-compose config
build:
	docker-compose build
build.57:
	make build.version mvn=5.7
build.80:
	make build.version mvn=8.0
build.version:
	MYSQL_VERSION_NUMBER=$(mvn) docker-compose build
start:
	docker-compose up -d
start.57:
	make start.versi mvn=5.7
start.80:
	make start.versi mvn=8.0
start.version:
	MYSQL_VERSION_NUMBER=$(mvn) docker-compose up -d
stop:
	docker-compose down
logs:
	docker-compose logs -f
ps:
	docker-compose ps
env:
	docker-compose exec db env
db.create:
	docker-compose exec -T db mysql -proot < sh/db_create.sh
db.show:
	docker-compose exec -T db mysql -proot -e 'SHOW DATABASES'
db.show.var:
	docker-compose exec -T db mysql -proot -e 'SHOW VARIABLES'
db.import:
	bash sh/db_import.sh
db.connect:
	bash sh/db_connect.sh
db.conf:
	docker-compose exec db bash -c 'find /etc/mysql -name *.cnf -exec cat {} \;|grep -v "#"'