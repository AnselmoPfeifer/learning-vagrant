#!/bin/bash
sudo -i << EOF
    # cp /vagrant/files/etc/apt/* /root/
    # apt-key add nginx_signing.key
    # echo "deb http://nginx.org/packages/ubuntu/ precise nginx" >> /etc/apt/sources.list
    # echo "deb-src http://nginx.org/packages/ubuntu/ precise nginx" >> /etc/apt/sources.list
    apt-get update && apt-get -y install nginx
   
    mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf-original
    cp /vagrant/files/etc/nginx/nginx.conf /etc/nginx/
    mv /etc/nginx/sites-available/default /etc/nginx/sites-available/default-original
    cp /vagrant/files/etc/nginx/sites-available/default /etc/nginx/sites-available/
    nginx -t
    service nginx restart
EOF
    
