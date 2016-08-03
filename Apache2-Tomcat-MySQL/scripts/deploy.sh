#!/bin/bash
sudo -i << EOF
        service tomcat stop
        mkdir /vagrant/files/
        cd /vagrant/files/
        cp /vagrant/public/cobranca/target/cobranca.war .

        service tomcat stop

        rm -rf /usr/local/tomcat/webapps/*
        rm -rf /usr/local/tomcat/works/*

        mv cobranca.war ROOT.war
        cp ROOT.war /usr/local/tomcat/webapps/
        chown tomcat:tomcat -R /usr/local/tomcat/webapps/

        service tomcat start
EOF
