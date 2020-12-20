#!/bin/bash

sudo bash -c '> /etc/default/tftpd-hpa'

sudo bash -c 'echo "## /etc/default/tftpd-hpa" >> /etc/default/tftpd-hpa'
sudo bash -c 'echo "TFTP_USERNAME="tftp"" >> /etc/default/tftpd-hpa'
sudo bash -c 'echo "TFTP_DIRECTORY="/tftp"" >> /etc/default/tftpd-hpa'
sudo bash -c 'echo "TFTP_ADDRESS="0.0.0.0:69"" >> /etc/default/tftpd-hpa'
sudo bash -c 'echo "TFTP_OPTIONS="--secure --create"" >> /etc/default/tftpd-hpa'





