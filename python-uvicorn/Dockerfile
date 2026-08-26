ARG PYTHON_IMAGE=python:3.14.4-alpine
FROM $PYTHON_IMAGE AS builder

WORKDIR /app

RUN pip install --upgrade pip

COPY src/requirements requirements
RUN pip install --no-cache-dir -r requirements/dev.txt

FROM builder AS dev

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

FROM builder AS prod

RUN pip install --no-cache-dir -r requirements/prod.txt

COPY src/ .

USER nobody

# CMD [ "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000" ]
CMD [ "gunicorn", "main:app", "-k", "uvicorn.workers.UvicornWorker", \
"--workers", "4", \
"--bind", "0.0.0.0:8000", \
"--timeout", "60", \
"--keep-alive", "5", \
"--graceful-timeout", "30" \
]
