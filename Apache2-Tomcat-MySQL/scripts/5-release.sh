#!/bin/bash
#Deploy
sudo rm -rf /vagrant/public
mkdir /vagrant/public
cd /vagrant/public/
git clone https://github.com/AnselmoPfeifer/mvc-com-spring.git
cd /vagrant/public/mvc-com-spring/cobranca/ && mvn clean package
