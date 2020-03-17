pull:
	docker-compose pull
build:
	docker-compose build
push:
	docker-compose push
start:
	docker-compose up -d
stop:
	docker-compose down
ps:
	docker-compose ps
logs:
	docker-compose logs -f
connect.master1:
	docker-compose exec master1 bash
connect.node1:
	docker-compose exec node1 bash
multipass.install:
	docker-compose exec master1 bash -c "yum -y install make; snap install multipass --classic --beta"
	docker-compose exec node1 bash -c "dnf -y install make; snap install multipass --classic --beta"
multipass.launch:
	docker-compose exec master1 bash -c "make launch.master"
	docker-compose exec node1 bash -c "make launch.node"