ARG PYTHON_IMAGE=python:3.14.4-alpine

FROM $PYTHON_IMAGE AS base

# Install curl
RUN apk add --no-cache curl

# Create app directory
WORKDIR /app

RUN pip install --no-cache-dir --upgrade pip

FROM base AS dev

# Copy and install Python dependencies
COPY src/requirements/base.txt src/requirements/dev.txt /app/requirements/
RUN pip install --no-cache-dir -r requirements/dev.txt

# Start FastAPI in dev mode
CMD [ "fastapi", "dev", "app/main.py", "--host", "0.0.0.0", "--port", "8000" ]

FROM base AS prod

# Copy and install Python dependencies
COPY src/requirements/base.txt src/requirements/prod.txt /app/requirements/
RUN pip install --no-cache-dir -r requirements/prod.txt

# Copy app code
COPY src .

USER nobody

# Start FastAPI app
CMD [ "fastapi", "run", "app/main.py", "--proxy-headers", "--port", "8000", "--workers", "4" ]
