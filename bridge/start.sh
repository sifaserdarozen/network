#!/bin/sh
set -ex

# create namespace and a veth interface, configure and connect to bridge
# Long veth names with 16 or more characters may lead error of
# 'Error: Attribute failed policy validation.'

# namespace romeo
ip netns add romeo
ip link add romeo-veth type veth peer romeo-breth
ip link set romeo-veth netns romeo
ip netns exec romeo ip addr add 10.10.0.10/16 dev romeo-veth
ip netns exec romeo ip link set dev romeo-veth up
ip netns exec romeo ip link set lo up

# namespace juliet
ip netns add juliet
ip link add juliet-veth type veth peer juliet-breth
ip link set juliet-veth netns juliet
ip netns exec juliet ip addr add 10.10.0.20/16 dev juliet-veth
ip netns exec juliet ip link set dev juliet-veth up
ip netns exec juliet ip link set lo up

# namespace mercutio
ip netns add mercutio
ip link add mercutio-veth type veth peer mercutio-breth
ip link set mercutio-veth netns mercutio
ip netns exec mercutio ip addr add 10.10.0.30/16 dev mercutio-veth
ip netns exec mercutio ip link set dev mercutio-veth up
ip netns exec mercutio ip link set dev lo up


# create a bridge in default namespace
ip link add love-br type bridge
ip link set romeo-breth master love-br
ip link set juliet-breth master love-br
ip link set mercutio-breth master love-br
ip link set love-br up
ip link set romeo-breth up
ip link set juliet-breth up
ip link set mercutio-breth up

sleep infinity