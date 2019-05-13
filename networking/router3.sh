#! /bin/bash

sudo ip route add 192.168.1.0/24 via 192.168.101.2 dev eth2
sudo ip route add 192.168.2.0/24 via 192.168.102.2 dev eth3