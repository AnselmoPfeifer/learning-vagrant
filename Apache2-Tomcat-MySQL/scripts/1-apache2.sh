#!/bin/bash
sudo -i << EOF
    apt-get -y update
    apt-get -y install aptitude
    aptitude -y install git
    aptitude -y install zip
    aptitude -y install maven
    aptitude -y install apache2
    echo "Install aptitude, paache2, zip, maven, git"

    service apache2 stop
    echo "Stop Apache2"

    rm -rf /etc/apache2/sites-available/*
    rm -rf /etc/apache2/sites-enabled/*
    rm -rf /var/www/*
    echo "Remove files the config apache2 "

    cp -R /vagrant/files/var/www/* /var/www/
    cp -f /vagrant/files/etc/apache2/apache2.conf /etc/apache2/
    cp -f /vagrant/files/etc/apache2/sites-available/*.conf /etc/apache2/sites-available/
    echo "Copy files conf apache2"
   
    cd /etc/apache2/mods-available && sudo a2enmod proxy_ajp && sudo a2enmod proxy
    cd /etc/apache2/sites-available/ && sudo a2ensite default.conf
    echo "Enable module proxy apache2 and default.conf"

    chown -R www-data:www-data /var/www/ && sudo chmod 755 -R /var/www/
    echo "Permission in directory www"

    service apache2 start
    echo "Start apache2"
    
EOF