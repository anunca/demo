#!/usr/bin/env bash

sed -i "s|/usr/lib/openssh/sftp-server|internal-sftp|" /etc/ssh/sshd_config

cat <<EOF>> /etc/ssh/sshd_config
Match Group sftpgroup
      X11Forwarding no
      AllowTcpForwarding no
      PermitTTY no
      ForceCommand internal-sftp
      ChrootDirectory /home
EOF