#!/bin/bash
sudo -i << EOF
    apt-get -y update
    apt-get -y install aptitude
    aptitude -y install git
    aptitude -y install zip
    aptitude -y install maven
    aptitude -y install nginx
    echo "Install aptitude, nginx, zip, maven, git"

    service nginx stop
    echo "Stop nginx"

    rm -rf /etc/nginx/sites-available/*
    rm -rf /etc/nginx/sites-enabled/*
    echo "Remove files the config nginx"

    cp /vagrant/files/etc/nginx/sites-available/*.conf /etc/nginx/sites-available/
    echo "Copy files conf nginx"
   
    ln -s /etc/nginx/sites-available/producao.conf /etc/nginx/sites-enabled/producao.conf
    echo "Enabled proxy and producao.conf"

    service nginx start
    echo "Start nginx"
    
EOF
