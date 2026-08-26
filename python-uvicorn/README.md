# Python Uvicorn
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://www.python.org
- https://uvicorn.dev
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
ab -n 1000 -c 100 http://127.0.0.1:8000/
```