#! /bin/bash

sudo ip route add 192.168.2.0/24 via 192.168.100.2 dev eth2
sudo ip route add 192.168.3.0/24 via 192.168.101.1 dev eth3