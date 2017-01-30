#!/bin/bash
if [ ! -f /etc/ssh/ssh_host_dsa_key ]
then
    dpkg-reconfigure openssh-server
fi

exec /usr/sbin/sshd -D -f /etc/ssh/sshd_config
