launch:
	multipass launch -c6 -m8G -d128G -nftp --cloud-init cloud-config.yaml
mount:
	multipass mount ../data ftp:/var/vsftpd
list:
	multipass list
stop:
	multipass stop ftp
shell:
	multipass shell ftp
	