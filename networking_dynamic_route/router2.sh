#! /bin/bash

# Install tools
echo "[TASK 2] Enable forward"
cat >>/etc/sysctl.conf<<EOF
net.ipv4.ip_forward = 1
EOF
sysctl -p

# Install quagga
echo "[TASK 3] Install quagga"
yum install -y quagga

# Config and start zebra
echo "[TASK 4] Config zebra"
cat >> /etc/quagga/zebra.conf<<EOF
password root
enable password root
log file /var/log/quagga/zebra.log
EOF
systemctl enable zebra
systemctl start zebra

# Config and start ripd
echo "[TASK 5] Config ripd"
cat >> /etc/quagga/ripd.conf<<EOF
password root
debug rip events
debug rip packet
router rip
 version 2
 network 192.168.2.0/24
 network 192.168.100.0/24
 network 192.168.102.0/24
interface eth0
 no ip rip authentication mode
log file /var/log/quagga/zebra.log
EOF
systemctl enable ripd
systemctl start ripd