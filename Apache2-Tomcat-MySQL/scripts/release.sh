#!/bin/bash
sudo rm -rf /vagrant/public
mkdir /vagrant/public

cd /vagrant/public/

wget http://192.168.0.16/cobranca.zip
unzip cobranca.zip

cd cobranca && mvn clean package
