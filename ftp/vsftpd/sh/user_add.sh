#!/usr/bin/env bash

FTP_USER=$1

function usage()
{
  echo "Usage: $0 [ftp user]"
  exit 1
}

if [[ -z $FTP_USER ]]
then
  echo "Error: missing container name parameter."
  usage
fi

adduser "$FTP_USER"
echo "$FTP_USER:$FTP_USER" | chpasswd
echo "$FTP_USER" >> /etc/vsftpd/chroot_list