# FastAPI + Elasticsearch

A small FastAPI service backed by Elasticsearch, with separate development and production Compose overlays.

## Requirements

- Docker with Compose v2
- GNU Make

Local settings belong in `.env.local`. Keep credentials out of Git.

## Documentation

- Build and run the local environment:
  - [Docker](doc/docker.md)
  - [Linux](doc/linux.md)
- Python: <https://docs.python.org/3/>
- FastAPI: <https://fastapi.tiangolo.com/tutorial/first-steps/>
- Pydantic: <https://docs.pydantic.dev/latest/>
- Python debugging in VS Code: <https://code.visualstudio.com/docs/python/debugging>
- Elasticsearch search documentation: <https://www.elastic.co/docs/solutions/search>

## Development

Inspect the effective configuration first:

```sh
make config
```

Build and start:

```sh
make start
make ps
```

Follow logs:

```sh
make logs
```

The API is bound to localhost at <http://localhost:8000>. Interactive documentation is available at <http://localhost:8000/docs>.

Run tests:

```sh
make test
```

Stop the stack:

```sh
make stop
```

To also remove this lab's volumes:

```sh
make clean
```

## Production overlay

```sh
ENV=prod make config
ENV=prod make start
```

The production overlay adds health-based dependency ordering and nginx in front of the application.

## Design notes

- Elasticsearch is intentionally configured as a single-node local service.
- Elasticsearch security is disabled in this demo; do not copy that setting to an Internet-facing or production deployment.
- Published ports are bound to `127.0.0.1` by default.
- The application image runs as an unprivileged user in the production stage.
