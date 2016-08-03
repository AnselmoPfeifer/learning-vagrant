#!/bin/bash
mkdir /vagrant/public
cd /vagrant/public/
git clone https://github.com/AnselmoPfeifer/financeiro.git
cd /vagrant/public/financeiro/
mvn clean package
