#!/bin/sh
set -ex

# create two virtual interfaces in pair
ip link add romeo-veth type veth peer juliet-veth

# configure juliet-veth
ip addr add 10.10.0.20/16 dev juliet-veth
ip link set dev juliet-veth up

# configure romeo-veth
ip addr add 10.10.0.10/16 dev romeo-veth
ip link set dev romeo-veth up

# enable system to receive its own packets, instead of dropping
echo 1 > /proc/sys/net/ipv4/conf/juliet-veth/accept_local
echo 1 > /proc/sys/net/ipv4/conf/romeo-veth/accept_local

# as the system will see packet also in sending (additional to receiving)
# we need seperate routing tables for outbound
# iif lo: local generated traffic
ip rule add priority 11 iif lo from 10.10.0.10 lookup 1001
ip rule add priority 21 iif lo from 10.10.0.20 lookup 2001
ip route add 10.10.0.20 dev romeo-veth table 1001
ip route add 10.10.0.10 dev juliet-veth table 2001

# since lo routing rule is checked first, newly added ones do not have a chance
# move lo routing rule to omewhat higher pririty (than 21)
ip rule add priority 100 lookup local 
ip rule del priority 0

sleep infinity