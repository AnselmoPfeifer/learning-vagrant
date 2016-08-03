#!/bin/sh
echo "Removendo o diretrio java em /usr/local/java/"
sudo rm -rf /usr/local/java/
echo "Criando o diretrio java em /usr/local/java/"
sudo mkdir /usr/local/java
cd /usr/local/java/
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
sudo tar -zxvf jdk-8u45-linux-x64.tar.gz
sudo rm jdk-8u45-linux-x64.tar.gz

cd jdk1.8.0_45/

sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_45/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_45/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_45/bin/javaws" 1
sudo update-alternatives --set java "/usr/local/java/jdk1.8.0_45/bin/java"
sudo update-alternatives --set javac "/usr/local/java/jdk1.8.0_45/bin/javac"
sudo update-alternatives --set javaws "/usr/local/java/jdk1.8.0_45/bin/javaws"

sudo -i << EOF
	echo "# Inicio das variaveis de ambiente java" >> /etc/profile
	echo "JAVA_HOME=/usr/local/java/jdk1.8.0_45" >> /etc/profile
	echo "export JAVA_HOME" >> /etc/profile
	echo "# Fim das variaveis de ambiente java" >> /etc/profile
	source /etc/profile
EOF

echo "JAVA8 Instalando"
