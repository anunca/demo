ARG PYTHON_IMAGE=python:3.14.7-alpine

FROM $PYTHON_IMAGE AS base

WORKDIR /app

# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip

FROM base AS dev

COPY src/requirements requirements
RUN pip install --no-cache-dir -r requirements/dev.txt

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

FROM base AS prod-builder

RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY src/requirements requirements
RUN pip install --no-cache-dir -r requirements/prod.txt

COPY src .

FROM base AS prod

ENV PATH="/opt/venv/bin:$PATH"
COPY --from=prod-builder /opt/venv /opt/venv
COPY --from=prod-builder /app .

USER nobody

# CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]
CMD [ "gunicorn", "main:app", "-k", "uvicorn.workers.UvicornWorker", \
"--workers", "4", \
"--bind", "0.0.0.0:8000", \
"--timeout", "60", \
"--keep-alive", "5", \
"--graceful-timeout", "30" \
]
