# demo

```sh
make build
make push
make pull
make start
make stop
```

```sh
# proxy
curl --header "Host: curl" --header "X-Forwarded-For: 1.1.1.1" --header "Remote-Addr: 1.1.1.1" localhost:80

# app1
curl --header "Host: curl" --header "X-Forwarded-For: 1.1.1.1" --header "Remote-Addr: 1.1.1.1" localhost:81

# app2
curl --header "Host: curl" --header "X-Forwarded-For: 1.1.1.1" --header "Remote-Addr: 1.1.1.1" localhost:82
```