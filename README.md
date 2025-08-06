# Experiments on linux networks

| Experiment | Summary |
| - | - |  
| [namespace](namespace/README.md) | Create two network namespaces ***romeo*** & ***juliet***, and connect them with veth pair  |  
| [fragmentation](namespace-fragment/README.md) | Create two network namespaces ***romeo*** & ***juliet***, and connect them with veth pair having different mtu values. Experimet fragmentation.  |  
| [bridge](bridge/README.md) | Create three network namespaces ***romeo***, ***juliet*** & ***mercutio*** and connect them with bridge.  |  
| [router](router/README.md) | Create three network namespaces ***romeo***, ***juliet*** & ***mercutio*** and connect them to default namespace with a bridge and provide public breakout.  |  
| [veth-pairs](veth-pairs/README.md) | Create a veth pair between ***romeo-veth***, ***juliet-veth*** and do modifications in network stack to make them connect eachother.  |  


### License
MIT License - see [LICENSE](LICENSE) for full text.