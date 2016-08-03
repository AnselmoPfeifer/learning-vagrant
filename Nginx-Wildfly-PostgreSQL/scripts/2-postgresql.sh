#!/bin/bash
dir_data='/postgresql/data'
password='5PabRy4eBTTuLyVkcv'
database='meubanco'
sudo -i << EOF
    mkdir /postgresql/ && mkdir /postgresql/data
    apt-get update
    aptitude -y install libxml2-dev libpq-dev bzip2 g++
    aptitude -y install postgresql-9.1 postgresql-server-dev-9.1 postgresql-contrib-9.1 
    /etc/init.d/postgresql stop

    echo "######################################"
    echo "          PostgreSQL Instalado        "
    echo "######################################"

    chmod -R 700 $dir_data
    chown -R postgres:postgres $dir_data
    su postgres
    cd /var/lib/postgresql && pwd
    #dir_data=/postgresql/data
    
    /usr/lib/postgresql/9.1/bin/initdb -D /postgresql/data/
    sed -i.bak -e "s@\/var\/lib\/postgresql\/9.1\/main@$dir_data@" /etc/postgresql/9.1/main/postgresql.conf
    sed -i.bak -e 's/ssl = true/#ssl = true/' /etc/postgresql/9.1/main/postgresql.conf
    service postgresql start 
    
    psql -c"ALTER user postgres WITH PASSWORD '$password'"   
    export PGUSER="postgres" 
    export PGPASSWORD=$password 
    psql -h localhost
    drop database $database;
    create database $database;
    \q 
    exit
    pg_restore --host localhost --port 5432 --verbose --dbname $database /vagrant/files/db/meubackup.backup
EOF
    echo "######################################"
    echo "          PostgreSQL Configurado       "
    echo "######################################"    
    
    
