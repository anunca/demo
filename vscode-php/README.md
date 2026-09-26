# VSCode PHP
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://code.visualstudio.com/docs/languages/php
## install
```sh
make help
```
## notes
### using per project
```sh
cat <<EOF | sudo tee /usr/local/bin/php > /dev/null
docker run -it --rm -v$(pwd):/app registry.app.internal/php-linter $@
EOF
```
```sh
chmod +x /usr/local/bin/php
```
```sh
cat <<EOF >> .vscode/settings.json
{
  "php.validate.enable": true,
  "php.validate.executablePath": "/usr/local/bin/php",
  "php.validate.run": "onSave"
}
EOF
```
### using globally
- macOS
```sh
cp bin/php-docker /opt/homebrew/bin/php-docker
```
- Linux
```sh
cp bin/php-docker /usr/local/bin/php-docker
```
>settings.json
- macOS
```json
{
  "php.validate.enable": true,
  "php.validate.executablePath": "/opt/homebrew/bin/php-docker",
  "php.validate.run": "onSave"
}
```
- Linux
```json
{
  "php.validate.enable": true,
  "php.validate.executablePath": "/usr/local/bin/php-docker",
  "php.validate.run": "onSave"
}
```