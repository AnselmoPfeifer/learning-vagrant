#!/bin/bash
echo "Update"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Vv3vdWckBSVQL3'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Vv3vdWckBSVQL3'
sudo apt-get -y install mysql-server --force-yes
echo "Install mysql-server"

sudo echo -e "drop database cobranca" | mysql -u root -pVv3vdWckBSVQL3
echo "drop database cobranca"
sudo echo -e "create database cobranca" | mysql -u root -pVv3vdWckBSVQL3
echo "create database cobranca"
sudo echo -e "GRANT ALL PRIVILEGES ON cobranca.* TO cobranca@localhost IDENTIFIED BY 'C41ZBxAmSLhRZliF' WITH GRANT OPTION;" | mysql -u root -pVv3vdWckBSVQL3
    
sudo cat /vagrant/files/db/cobranca.sql | mysql -u root -pVv3vdWckBSVQL3 cobranca
echo "Import dada to database cobranca"
sudo service mysql-server start
echo "Start server MySQL"

