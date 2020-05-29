FROM ubuntu:19.10

RUN apt-get update -qq\
  && apt-get install -y pure-ftpd\
  && rm -rf /var/lib/apt/lists/*

RUN groupadd ftpgroup\
  && useradd -g ftpgroup --system ftpuser

EXPOSE 20-21

CMD ["pure-ftpd", "--login", "puredb:/etc/pure-ftpd/pureftpd.pdb", "--createhomedir"]