#!/bin/bash
apt-get -y update
DEBIAN_FRONTEND=noninteractive apt-get -y upgrade
rm -rf /tmp/* /var/tmp/*
history -c
cat /dev/null > /root/.bash_history
unset HISTFILE
apt-get -y autoremove
apt-get -y autoclean
find /var/log -mtime -1 -type f -exec truncate -s 0 {} \;
rm -rf /var/log/*.gz /var/log/*.[0-9] /var/log/*-????????
rm -rf /var/lib/cloud/instances/* /var/lib/apt/lists/*
rm -f /root/.ssh/authorized_keys /etc/ssh/*key*
rm -f ~/.ssh/authorized_keys
dd if=/dev/zero of=/zerofile bs=1m; sync; rm /zerofile; sync
cat /dev/null > /var/log/lastlog; cat /dev/null > /var/log/wtmp
