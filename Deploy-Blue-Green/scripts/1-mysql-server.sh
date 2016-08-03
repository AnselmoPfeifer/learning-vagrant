#!/bin/bash
#Variaveis
database='financeiro'
usuario='financeiro'
senha='C41ZBxAmSLhRZliF'
host='producao.localhost.com'
host2='homologacao.localhost.com'

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Vv3vdWckBSVQL3'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Vv3vdWckBSVQL3'
sudo apt-get -y install mysql-server --force-yes

echo "Install mysql-server"
sudo echo -e "create database $database" | mysql -u root -pVv3vdWckBSVQL3
sudo echo -e "GRANT ALL PRIVILEGES ON $database.* TO $usuario@localhost IDENTIFIED BY '$senha' WITH GRANT OPTION;" | mysql -u root -pVv3vdWckBSVQL3
sudo echo -e "GRANT ALL PRIVILEGES ON $database.* TO $usuario@$host IDENTIFIED BY '$senha' WITH GRANT OPTION;" | mysql -u root -pVv3vdWckBSVQL3
sudo echo -e "GRANT ALL PRIVILEGES ON $database.* TO $usuario@$host2 IDENTIFIED BY '$senha' WITH GRANT OPTION;" | mysql -u root -pVv3vdWckBSVQL3
    
sudo service mysql start
echo "Start server MySQL"

echo "mysql -u financeiro -pC41ZBxAmSLhRZliF -h producao.localhost.com"
