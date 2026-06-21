# Docker Multipass

## install
homebrew https://docs.brew.sh/Installation

# docker

## install
```sh
brew install docker
```
# multipass

## install
```sh
brew install multipass
```

## init cloud config
```sh
bash sh/init-cloud-config.sh
```

## create vm
```sh
multipass launch -c 2 -m 2G -d 20G -n docker-engine 20.04 --cloud-init etc/cloud-config.yaml
multipass mount $HOME/App docker-engine
```

## init-docker-engine-ip
```sh
bash sh/init-docker-engine-ip.sh
```

### multipass

#### info
```sh

multipass list

for S in `multipass list | grep -i running | awk '{print $1}'`; do echo $S && multipass info $S; done

multipass list | grep docker-engine | awk '{print $1}' | xargs multipass info

multipass info --all

multipass shell docker-engine
```
