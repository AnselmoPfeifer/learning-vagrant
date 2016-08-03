#!/bin/bash
sudo -i << EOF
    cd /vagrant/files/tomcat 
    wget http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.0.35/bin/apache-tomcat-8.0.35.zip
    unzip apache-tomcat-8.0.35.zip
    rm -rf /usr/local/tomcat*
    cp -r /vagrant/files/tomcat/apache-tomcat-8.0.35.zip /usr/local/
    rm /usr/local/apache-tomcat-8.0.35.zip
    mv apache-tomcat-8.0.35 tomcat
    cd /usr/local/tomcat/bin/ && chmod +x *.sh

    useradd tomcat -s /bin/false --home /usr/local/tomcat/webapps/

    #Adicionar tomcat na inicializacao do sistema
    cp /vagrant/files/etc/init.d/tomcat /etc/init.d/
    chmod 755 /etc/init.d/tomcat
    update-rc.d tomcat defaults
    service tomcat start
EOF

echo "Tomcat instalado"
