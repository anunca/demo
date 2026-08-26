# Linux
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://pypi.org/project/pip/
## install
Python and modules
```sh
sudo apt install -y\
python3\
python3-pip
```
app requirements
```sh
pip install --no-cache-dir -r src/requirements/dev.txt
```
## notes
run app
```sh
YOUR_ELASTICSEARCH_HOST=localhost
YOUR_ELASTICSEARCH_PORT=9200
```
```sh
export ELASTICSEARCH_HOST=$YOUR_ELASTICSEARCH_HOST
export ELASTICSEARCH_PORT=$YOUR_ELASTICSEARCH_PORT
```
```sh
fastapi dev src/app/main.py
```
use virtual env
- install
```sh
sudo apt install -y python3-venv
```
- create
```sh
python3 -m venv .venv
```
- activate
```sh
source .venv/bin/activate
```
```sh
python3 -m pip install --no-cache-dir --upgrade pip
```
- deactivate
```sh
deactivate
```
browse [API](http://localhost:8000/health) 🚀