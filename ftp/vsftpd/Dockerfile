ARG OS_VERSION=centos:7.9.2009
FROM $OS_VERSION

RUN yum update -y\
  && yum install -y vsftpd\
  && yum clean all

# hadolint ignore=DL4006
RUN echo 'root:root' | chpasswd\
  && mkdir /var/vsftpd\
  && chmod 777 /var/vsftpd

RUN sed -i '\
  s/#write_enable=YES/write_enable=YES/g;\
  s/anonymous_enable=YES/anonymous_enable=NO/g;\
  s/#local_umask=022/local_umask=022/g;\
  s/#ftpd_banner=Welcome to blah FTP service./ftpd_banner=Welcome/g;\
  s/#chroot_local_user=YES/chroot_local_user=NO/g;\
  s/#chroot_list_enable=YES/chroot_list_enable=YES/g;\
  s|#chroot_list_file=/etc/vsftpd/chroot_list|chroot_list_file=/etc/vsftpd/chroot_list|g;\
  ' /etc/vsftpd/vsftpd.conf &&\
  sed -i 's/root//g' /etc/vsftpd/user_list &&\
  sed -i 's/root//g' /etc/vsftpd/ftpusers &&\
  echo 'root' >> /etc/vsftpd/chroot_list &&\
  echo "background=NO" >> /etc/vsftpd/vsftpd.conf &&\
  echo "allow_writeable_chroot=YES" >> /etc/vsftpd/vsftpd.conf &&\
  echo "local_max_rate=O" >> /etc/vsftpd/vsftpd.conf &&\
  echo "max_per_ip=0" >> /etc/vsftpd/vsftpd.conf &&\
  echo "ascii_upload_enable=YES" >> /etc/vsftpd/vsftpd.conf &&\
  echo "ascii_download_enable=YES" >> /etc/vsftpd/vsftpd.conf &&\
  echo "pasv_promiscuous=YES" >> /etc/vsftpd/vsftpd.conf &&\
  echo "local_root=/var/vsftpd" >> /etc/vsftpd/vsftpd.conf

EXPOSE 20-21

ENTRYPOINT ["/usr/sbin/vsftpd", "/etc/vsftpd/vsftpd.conf"]
