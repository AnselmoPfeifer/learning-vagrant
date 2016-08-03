#!/bin/bash
sudo -i << EOF
    useradd tomcat -s /bin/false --home /usr/local/tomcat/webapps/
    cd /usr/local/
    wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v8.0.35/bin/apache-tomcat-8.0.35.zip
    unzip apache-tomcat-8.0.35.zip 
    mv apache-tomcat-8.0.35 tomcat
    cd /usr/local/tomcat/bin/ 
    chmod +x *.sh
    rm /usr/local/apache-tomcat-8.0.35.zip    

    cp /vagrant/files/etc/init.d/tomcat /etc/init.d/
    chmod 755 /etc/init.d/tomcat
    update-rc.d tomcat defaults   
    service tomcat start
EOF

echo "Tomcat instalado"
