#!/bin/bash

yum -y install nfs-utils
mkdir /mnt/upload
systemctl enable rpcbind
systemctl start rpcbind

mount -t nfs -o proto=udp,vers=3  192.168.50.10:/mnt/upload /mnt/upload

echo "192.168.50.10:/upload /mnt/upload nfs rw,vers=3,sync,proto=udp,rsize=32768,wsize=32768 0" >>/etc/fstab
