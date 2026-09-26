#!/usr/bin/env bash

/usr/sbin/exportfs -r
/sbin/rpcbind -s
/usr/sbin/rpc.nfsd
/usr/sbin/rpc.mountd

while true; do

  # Check if NFS is STILL running by recording it's PID (if it's not running $pid will be null):
  pid=`pidof rpc.mountd`
  # If it is not, lets kill our PID1 process (this script) by breaking out of this while loop:
  # This ensures Docker observes the failure and handles it as necessary
  if [[ -z "$pid" ]]
  then
    echo "NFS has failed, exiting, so Docker can restart the container..."
    break
  fi

  # If it is, give the CPU a rest
  sleep 1

done