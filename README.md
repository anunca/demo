# Demo labs

A hands-on collection of infrastructure, container, networking, security, observability, web-server, and application labs.

> **Lab repository:** examples are intentionally small and independent. Review credentials, exposed ports, image tags, and security settings before adapting a lab for production.

## Quick start

Requirements:

- Docker Engine or Docker Desktop with **Compose v2** (`docker compose`)
- GNU Make
- Git
- Lab-specific tools documented in each README (for example `kubectl` or `argocd`)

Clone the repository, choose a lab, and inspect its commands:

```sh
git clone https://github.com/anunca/demo.git
cd demo/argocd
make help
```

Where a lab provides Compose configuration, validate the rendered configuration before starting it:

```sh
docker compose config
```

## Labs

| Area | Lab | Purpose |
| --- | --- | --- |
| GitOps / Kubernetes | [Argo CD](./argocd/README.md) | Deploy a Kubernetes application using Argo CD |
| TLS | [Certbot](./certbot/README.md) | Request and manage certificates with containerized Certbot |
| Containers | [Docker Buildx](./docker/buildx/README.md) | Build multi-platform container images |
| Containers / macOS | [Colima](./docker/colima/README.md) | Run container workloads on macOS |
| Containers / VM | [Multipass](./docker/multipass/README.md) | Provision an Ubuntu VM for a remote Docker Engine |
| Observability | [EFK](./efk/README.md) | Explore Elasticsearch, Filebeat, and Kibana logging |
| Application | [FastAPI + Elasticsearch](./fastapi-elasticsearch/README.md) | Run a FastAPI service backed by Elasticsearch |
| Networking | [Pure-FTPd](./ftp/pure-ftpd/README.md) | Run a Pure-FTPd server |
| Networking | [vsftpd](./ftp/vsftpd/README.md) | Run a vsftpd server |
| Automation | [GitHub cron](./github-cron/README.md) | Experiment with scheduled GitHub automation |
| Automation | [GitHub release](./github-release/README.md) | Create tags and release packages |
| Proxy / LB | [HAProxy](./haproxy/README.md) | Load balance HTTP traffic |
| TLS | [Let's Encrypt](./letsencrypt/README.md) | Configure nginx with Let's Encrypt certificates |
| Security | [Metasploit](./metasploit/README.md) | Explore Metasploit in an isolated lab |
| Database | [MongoDB](./mongodb/README.md) | Run a local MongoDB environment |
| Storage | [NFS](./nfs/README.md) | Run and mount an NFSv4 server |
| Security | [Nmap](./nmap/README.md) | Explore network scanning against authorized lab targets |
| Observability | [OpenSearch](./opensearch/README.md) | Run OpenSearch and Dashboards locally |
| Networking | [OpenSSH](./openssh/README.md) | Run and connect to a containerized SSH server |
| Application | [Python / Uvicorn](./python-uvicorn/README.md) | Run and benchmark an ASGI application |
| Application | [Rust](./rust/README.md) | Build, run, and debug a Rust project |
| Proxy | [Traefik](./traefik/README.md) | Route HTTPS traffic with Traefik |
| Cache | [Varnish ESI](./varnish/README.md) | Compose cached page fragments with ESI |
| VSCode | [PHP](./vscode-php/README.md) | Configure containerized PHP validation in Visual Studio Code |
| Web server | [Apache](./web-server/apache/README.md) | Build and run Apache |
| Web server | [Caddy](./web-server/caddy/README.md) | Run Caddy with optional DNS integration |
| Web server | [nginx + Apache TLS](./web-server/nginx-httpd-ssl/README.md) | Terminate TLS with nginx in front of Apache |
| Web server | [nginx TLS](./web-server/nginx-ssl/README.md) | Explore nginx with local TLS certificates |

## Repository conventions

- Prefer `docker compose` over the legacy `docker-compose` command.
- Keep secrets and machine-local configuration out of Git; use `.env.example` for documented placeholders.
- Bind development-only services to `127.0.0.1` unless remote access is intentional.
- Prefer explicit, maintained image tags over `latest`.
- Run `make help` in labs that provide a Makefile.
- Treat security-oriented examples as isolated labs and scan only systems you own or are authorized to test.

## Validation

The repository includes a lightweight GitHub Actions workflow that checks whitespace and validates base Compose files. Individual labs can add deeper tests as they are modernized.

## Modernization

This repository contains experiments created over several years. Modernization is intentionally incremental so each lab remains understandable and independently runnable. Current priorities are Compose v2 consistency, maintained container images, safer defaults, reproducible configuration, CI validation, and clearer documentation.
