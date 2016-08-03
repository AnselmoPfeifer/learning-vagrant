#!/bin/sh
sudo -i << EOF
    echo "Removendo o diretrio java em /usr/local/java/"
    rm -rf /usr/local/java/
    echo "Criando o diretrio java em /usr/local/java/"
    mkdir /usr/local/java
    cd /usr/local/java/
    cp /vagrant/files/java/jdk-8u65-linux-x64.tar.gz .
    tar -zxvf jdk-8u65-linux-x64.tar.gz
    rm jdk-8u65-linux-x64.tar.gz

    cd jdk1.8.0_65/
EOF
    
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_65/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_65/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_65/bin/javaws" 1
sudo update-alternatives --set java "/usr/local/java/jdk1.8.0_65/bin/java"
sudo update-alternatives --set javac "/usr/local/java/jdk1.8.0_65/bin/javac"
sudo update-alternatives --set javaws "/usr/local/java/jdk1.8.0_65/bin/javaws"

sudo -i << EOF
echo "# Inicio das variaveis de ambiente java" >> /etc/profile
echo "JAVA_HOME=/usr/local/java/jdk1.8.0_65" >> /etc/profile
echo "export JAVA_HOME" >> /etc/profile
echo "# Fim das variaveis de ambiente java" >> /etc/profile
source /etc/profile
EOF
echo "JAVA8 Instalando"

