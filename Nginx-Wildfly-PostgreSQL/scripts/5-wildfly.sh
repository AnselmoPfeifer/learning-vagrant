#!/bin/bash
sudo -i << EOF
	cd /vagrant/wildfly/ 
	wget http://download.jboss.org/wildfly/8.1.0.Final/wildfly-8.1.0.Final.zip

	cp -r /vagrant/files/wildfly/wildfly-8.1.0.Final.zip /usr/local/
	cd /usr/local/ && unzip  wildfly-8.1.0.Final.zip  
	mv /usr/local/wildfly-8.1.0.Final /usr/local/wildfly 
EOF
