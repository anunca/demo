ARG OS_IMAGE=ubuntu:20.04
FROM $OS_IMAGE

RUN apt update -qq\
  && apt install -y openssh-server\
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/run/sshd

RUN sed -i '\
s|#HostKey /etc/ssh/ssh_host_rsa_key|HostKey /etc/ssh/ssh_host_rsa_key|;\
s|#HostKey /etc/ssh/ssh_host_ecdsa_key|HostKey /etc/ssh/ssh_host_ecdsa_key|;\
s|#HostKey /etc/ssh/ssh_host_ed25519_key|HostKey /etc/ssh/ssh_host_ed25519_key|;\
' /etc/ssh/sshd_config

COPY sh/chroot.sh .
RUN bash chroot.sh\
  && rm chroot.sh

ARG USERNAME

RUN groupadd sftpgroup

RUN adduser $USERNAME\
  && usermod -G sftpgroup $USERNAME\
  && echo "$USERNAME:$USERNAME" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
