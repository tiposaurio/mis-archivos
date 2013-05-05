#! /bin/bash
iptables -F

iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -s 192.168.11.0/24 -i eth5 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.11.0/24 -o eth1 -j MASQUERADE

iptables -A INPUT -s 192.168.22.0/24 -i eth6 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.22.0/24 -o eth1 -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward
echo "warning...running....:)"
