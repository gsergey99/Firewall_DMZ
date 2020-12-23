#!/bin/bash 


# Configuracion para el dnsmasq.conf

var_init=$(sudo tail -n1 /etc/dnsmasq.conf)

if [ $var_init != '#end' ];then  
sudo bash -c 'echo "port=53" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "domain-needed" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "bogus-priv" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "strict-order" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "interface=eth3" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "listen-address=192.168.0.1" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "expand-hosts" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "domain=example.com" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "dhcp-range=eth3,192.168.0.2,192.168.0.254,255.255.255.0,24h" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "#end" >> /etc/dnsmasq.conf'

sudo bash -c '> /etc/resolv.conf'
sudo bash -c 'echo "nameserver 10.35.0.1" >> /etc/resolv.conf'
sudo bash -c 'echo "nameserver 8.8.8.8" >> /etc/resolv.conf'

sudo systemctl restart dnsmasq.service
fi