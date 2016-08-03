#!/bin/bash
#Deploy
sudo -i << EOF
    cp /vagrant/public/mvc-com-spring/cobranca/target/cobranca.war /vagrant/files/
    cd /etc/apache2/sites-available/ && a2ensite manutencao.conf && a2dissite default.conf
    service apache2 reload
    service tomcat stop
    sh /usr/local/tomcat/bin/shutdown.sh
    rm -rf /usr/local/tomcat/webapps/*
    rm -rf /usr/local/tomcat/works/*

    cp -rf /vagrant/files/cobranca.war /usr/local/tomcat/webapps/
    cp -rf /vagrant/files/cobranca.war /usr/local/tomcat/webapps/ROOT.war
    chown tomcat:tomcat -R /usr/local/tomcat/webapps/
    service tomcat start
    sleep 10
    cd /etc/apache2/sites-available && a2ensite default.conf && a2dissite manutencao.conf
    service apache2 reload
#   rm -rf /vagrant/public
EOF

echo "###########################################"
echo "                                           "
echo "	    Acesse http://localhost:8081	 "
echo "                                           "
echo "###########################################"
