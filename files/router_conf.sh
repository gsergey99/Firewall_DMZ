#!/bin/bash 


# Configuracion para el dnsmasq.conf
sudo bash -c 'echo "port=53" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "domain-needed" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "bogus-priv" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "strict-order" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "interface=eth3" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "listen-address=192.168.0.1" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "expand-hosts" >> /etc/dnsmasq.conf'
sudo bash -c 'echo "domain=example.com" >> /etc/dnsmasq.conf'

sudo bash -c 'echo "dhcp-range=eth3,192.168.0.2,192.168.0.254,255.255.255.0,24h" >> /etc/dnsmasq.conf'

sudo systemctl restart dnsmasq.service
sudo systemctl status dnsmasq.service