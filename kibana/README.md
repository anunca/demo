# kibana
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://www.elastic.co/fr/kibana
- https://www.elastic.co/docs/deploy-manage/deploy/self-managed/install-kibana-with-docker
## install
elastic
```sh
docker network create elastic
```
```sh
docker pull docker.elastic.co/elasticsearch/elasticsearch:9.3.3
```
```sh
docker run --name es-node01 --net elastic -p 9200:9200 -p 9300:9300 -t docker.elastic.co/elasticsearch/elasticsearch:9.3.3
```
kibana
```sh
docker pull docker.elastic.co/kibana/kibana:9.3.3
```
```sh
docker run --name kib-01 --net elastic -p 5601:5601 docker.elastic.co/kibana/kibana:9.3.3
```
httpd
```sh
docker run -it --name httpd-01 --net elastic -p 8080:80 debian:11.6-slim bash
```
```sh
apachectl start
```
elastic agent
```sh
curl -L -O https://artifacts.elastic.co/downloads/beats/elastic-agent/elastic-agent-9.3.3-linux-x86_64.tar.gz\
&& tar xzvf elastic-agent-9.3.3-linux-x86_64.tar.gz\
&& cd elastic-agent-9.3.3-linux-x86_64
```
```sh
echo "" >  elastic-agent.yml
nano  elastic-agent.yml
```
```sh
./elastic-agent install
```
## notes
dependencies
```sh
sudo apt update\
&& sudo apt install -y curl apache2 nano
```