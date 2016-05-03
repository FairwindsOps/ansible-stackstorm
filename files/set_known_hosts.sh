#!/bin/bash

key=`cut -d ' ' -f2 /etc/ssh/ssh_host_ecdsa_key.pub`
ip_addr=`/sbin/ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'`

echo localhost ecdsa-sha2-nistp256 $key >> /etc/ssh/ssh_known_hosts
echo $ip_addr ecdsa-sha2-nistp256 $key >> /etc/ssh/ssh_known_hosts
