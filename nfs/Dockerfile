ARG OS_IMAGE=ubuntu:20.04

FROM $OS_IMAGE

RUN apt-get update -qq\
  && apt-get install -y nfs-kernel-server\
  && rm -rf /var/lib/apt/lists/*

COPY etc/exports /etc/exports

ARG NFS_DIRECTORY
ARG NFS_HOST
ARG NFS_OPTIONS

RUN mkdir -p $NFS_DIRECTORY\
  && chmod -R 777 /srv\
  && echo "$NFS_DIRECTORY $NFS_HOST($NFS_OPTIONS)" >> /etc/exports

COPY bin/nfsd.sh /bin/nfsd.sh

RUN chmod +x /bin/nfsd.sh

EXPOSE 2049

CMD [ "/bin/nfsd.sh" ]
