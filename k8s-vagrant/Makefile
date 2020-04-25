vagrant.install:
	#TODO
	#https://www.vagrantup.com/downloads.html
cluster.launch:
	vagrant provision
	make start
cluster.purge:
	make stop
	make delete
	make list
start:
	vagrant up
stop:
	vagrant halt
restart:
	vagrant reload
delete:
	vagrant destroy
list:
	vagrant global-status
