# Demo labs

Hands-on infrastructure and application examples covering containers, networking, security, observability, web servers, and developer tooling.

| Lab | Purpose |
| --- | --- |
| [Argo CD](./argocd/README.md) | Install Argo CD and deploy a Kubernetes application with GitOps |
| [Certbot](./certbot/README.md) | Request and manage TLS certificates with containerized Certbot |
| [Docker Buildx](./docker/buildx/README.md) | Build multi-platform container images with Docker Buildx |
| [Docker with Colima](./docker/colima/README.md) | Run Docker or Incus containers on macOS with Colima |
| [Docker with Multipass](./docker/multipass/README.md) | Provision an Ubuntu VM for a remote Docker Engine |
| [EFK](./efk/README.md) | Collect and inspect logs with Elasticsearch, Filebeat, and Kibana |
| [FastAPI Elasticsearch](./fastapi-elasticsearch/README.md) | Build a FastAPI service backed by Elasticsearch |
| [Pure-FTPd](./ftp/pure-ftpd/README.md) | Run and manage a Pure-FTPd server |
| [Vsftpd](./ftp/vsftpd/README.md) | Run and manage a vsftpd server |
| [GitHub cron](./github-cron/README.md) | Experiment with scheduled GitHub automation |
| [GitHub release](./github-release/README.md) | Create version tags and GitHub release packages |
| [HAProxy](./haproxy/README.md) | Load balance and cache HTTP traffic with HAProxy |
| [Let's Encrypt](./letsencrypt/README.md) | Configure nginx with Let's Encrypt certificates |
| [Metasploit](./metasploit/README.md) | Run Metasploit with a database-backed workspace |
| [MongoDB](./mongodb/README.md) | Run a containerized MongoDB environment |
| [NFS](./nfs/README.md) | Run and mount an NFSv4 server locally |
| [Nmap](./nmap/README.md) | Scan a target host with Nmap |
| [OpenSearch](./opensearch/README.md) | Run OpenSearch and OpenSearch Dashboards locally |
| [OpenSSH](./openssh/README.md) | Run and connect to a containerized OpenSSH server |
| [Python Uvicorn](./python-uvicorn/README.md) | Run and benchmark a Python application with Uvicorn |
| [Rust](./rust/README.md) | Build, run, and debug a Rust project |
| [Traefik](./traefik/README.md) | Route HTTPS traffic through Traefik with local certificates |
| [Varnish ESI](./varnish/README.md) | Compose cached page fragments with Edge Side Includes |
| [Apache](./web-server/apache/README.md) | Build and run a containerized Apache web server |
| [Caddy](./web-server/caddy/README.md) | Run Caddy with optional Route 53 DNS integration |
| [nginx and Apache SSL](./web-server/nginx-httpd-ssl/README.md) | Terminate TLS with nginx in front of Apache |
| [nginx SSL](./web-server/nginx-ssl/README.md) | Configure nginx with locally trusted TLS certificates |

## Requirements

- Docker with Compose v2
- GNU Make
- Any lab-specific CLI listed in that lab's README

Each lab has its own README. Run `make help` where a Makefile is provided to see the available commands.
