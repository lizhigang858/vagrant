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

#Install nfs-utils
echo "[TASK 5] Install nfs-utils"
echo yum install -y -q nfs-utils

#Config /etc/exports
echo "[TASK 5] /etc/exports可以参考鸟哥"
cat >> /etc/exports<<EOF
#所有IP都可以读写，并且没有root压缩
/tmp  *(fsid=0,rw,no_root_squash)
#10.42.0.228可以读写，其它IP只可以读
/home/vagrant 10.42.0.228(rw) *(ro)
#我要讓 *.example.com 網域的主機，登入我的 NFS 主機時，可以存取 /home/linux ，但是他們存資料的時候，我希望他們的 UID 與 GID 都變成 45 這個身份的使用者，假設我 NFS 伺服器上的 UID 45 與 GID 45 的用戶/群組名稱為 nfsanon
/home/linux   *.example.com(rw,all_squash,anonuid=45,anongid=45)
EOF

# Start rpcbind and nfs
echo "[TASK 5] 启动rpcbind和nfs"
systemctl enable rpcbind
systemctl start rpcbind
systemctl enable nfs
systemctl start nfs

