#!/bin/bash
echo "Checking firewall status..."
sudo ufw status

echo "Checking users with sudo privileges..."
getent group sudo

echo "Checking SSH root login settings..."
grep "PermitRootLogin" /etc/ssh/sshd_config
