#!/bin/sh
set -ex

# generate two network namespaces juliet & romeo
ip netns add juliet
ip netns add romeo

# create two virtual interfaces in pair
ip link add romeo-veth type veth peer juliet-veth

# move virtual interfaces to corresponding namespaces
ip link set juliet-veth netns juliet
ip link set romeo-veth netns romeo

# configure interfaces in juliet namespace
ip netns exec juliet ip link set lo up
ip netns exec juliet ip link set dev juliet-veth up
ip netns exec juliet ip addr add 10.10.0.20/16 dev juliet-veth

# configure interfaces in romeo namespace
ip netns exec romeo ip link set dev lo up
ip netns exec romeo ip link set dev romeo-veth up
ip netns exec romeo ip addr add 10.10.0.10/16 dev romeo-veth

sleep infinity