#! /bin/bash

sudo ip route add 192.168.1.0/24 via 192.168.100.1 dev eth2
sudo ip route add 192.168.3.0/24 via 192.168.102.1 dev eth3