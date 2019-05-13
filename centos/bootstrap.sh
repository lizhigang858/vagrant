#!/bin/bash

# Disable SELinux
echo "[TASK 1] Disable SELinux"
setenforce 0
sed -i --follow-symlinks 's/^SELINUX=enforcing/SELINUX=disabled/' /etc/sysconfig/selinux

# Stop and disable firewalld
echo "[TASK 2] Stop and Disable firewalld"
systemctl disable firewalld >/dev/null 2>&1
systemctl stop firewalld

# Enable ssh password authentication
echo "[TASK 3] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl reload sshd

# Set Root password
echo "[TASK 4] Set root password"
echo "root" | passwd --stdin root >/dev/null 2>&1

# Install tools
echo "[TASK 5] Install tools"
yum install -y -q net-tools traceroute telnet vim