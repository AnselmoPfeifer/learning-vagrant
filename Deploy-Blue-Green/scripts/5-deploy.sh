#!/bin/bash
#Deploy
sudo -i << EOF
    service tomcat stop
    rm -rf /usr/local/tomcat/webapps/*
    rm -rf /usr/local/tomcat/works/*

    cp /vagrant/public/financeiro/target/ROOT.war /usr/local/tomcat/webapps/

    chown tomcat:tomcat -R /usr/local/tomcat/webapps/

    service tomcat start
    sleep 10

EOF
