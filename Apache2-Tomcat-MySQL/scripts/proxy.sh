#!/bin/bash

sudo -i << EOF
	ifconfig eth1 192.168.0.17 netmask 255.255.255.0 up 
	echo "127.0.0.1	server producao.local.com" >> /etc/hosts
	echo "192.168.0.16	homologacao.local.com" >> /etc/hosts
	echo "192.168.0.16	mysqlserver.producao.local.com" >> /etc/hosts
EOF
