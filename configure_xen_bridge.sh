brctl addbr xen_bridge
brctl addif xen_bridge eth0
ifconfig eth0 0.0.0.0
ifconfig xen_bridge 192.168.178.70
ifconfig -a
route add default gw 192.168.178.1
route -n
