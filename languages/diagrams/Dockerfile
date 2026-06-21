ARG PYTHON_IMAGE=python:3-alpine
FROM $PYTHON_IMAGE

RUN apk --no-cache add gcc libc-dev graphviz

WORKDIR /app

COPY ./src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY ./src .

CMD ["python", "app.py"]
