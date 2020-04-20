config:
	docker-compose config
start:
	docker-compose up -d
stop:
	docker-compose down
restart:
	docker-compose restart
ps:
	docker-compose ps
logs:
	docker-compose logs -f
shell.master:
	docker-compose exec master sh
shell.slave:
	docker-compose exec slave sh
mysql.master:
	docker-compose exec master mysql -uroot -proot mysql
mysql.slave:
	docker-compose exec slave mysql -uroot -proot mysql