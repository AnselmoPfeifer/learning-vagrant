#!/bin/bash
sudo -i << EOF
    useradd tomcat -s /bin/false --home /usr/local/tomcat/webapps/
    cd /usr/local/
    cp /vagrant/files/tomcat/apache-tomcat-8.0.35.zip .
    unzip apache-tomcat-8.0.35.zip 
    mv apache-tomcat-8.0.35 tomcat
    cd tomcat/bin/ && chmod +x *.sh
    rm /usr/local/apache-tomcat-8.0.35.zip
    
    cp /vagrant/files/etc/init.d/tomcat /etc/init.d/
    chmod 755 /etc/init.d/tomcat
    update-rc.d tomcat defaults   
    service tomcat start
EOF

echo "Tomcat instalado"
