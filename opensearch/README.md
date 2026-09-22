# OpenSearch
## overview
- [doc](#doc)
- [install](#install)
- [notes](#notes)
## doc
- https://opensearch.org/docs/latest/about/
## install
```sh
make help
```
## notes
prod
```sh
export ENV=prod
```
config
>a minimum 8 character password and must contain at least one uppercase letter, one lowercase letter, one digit, and one special character that is strong.
- Password strength can be tested here https://lowe.github.io/tryzxcvbn
```sh
cat <<'EOF' >> .env
OPENSEARCH_INITIAL_ADMIN_PASSWORD=YOUR_OPENSEARCH_INITIAL_ADMIN_PASSWORD
EOF
```
start
```sh
make start
```
browse [app](http://localhost:5601)