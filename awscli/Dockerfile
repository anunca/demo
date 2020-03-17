ARG PYTHON_VERSION

FROM $PYTHON_VERSION

RUN pip install awscli --no-cache-dir

ENTRYPOINT [ "aws" ]

CMD [ "configure", "list" ]