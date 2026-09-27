# Docker buildx
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://docs.docker.com/build/building/multi-platform/#simple-multi-platform-build-using-emulation
- https://docs.docker.com/reference/cli/docker/buildx/build/
## install
```sh
make help
```
## notes
prod
```sh
export ENV=prod
```
```sh
cat <<'EOF' >> .env
GITHUB_TOKEN=YOUR_GITHUB_TOKEN
EOF
```
browse GitHub [packages containers](https://github.com/anunca?ecosystem=container&tab=packages)