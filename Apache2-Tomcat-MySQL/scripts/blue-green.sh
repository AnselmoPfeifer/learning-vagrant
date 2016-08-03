#!/bin/bash
echo "----------------------------------------------"
echo "Nova versao esta em homolog (1) ou producao(0)"
echo "----------------------------------------------"

read versao

if  [ $versao -eq "1" ]; then
        rm /etc/nginx/sites-enabled/producao.conf
        ln -s /etc/nginx/sites-available/homologacao.conf /etc/nginx/sites-enabled/homologacao.conf
        service nginx reload
sleep 1
clear
        echo "--------------------------------------------------"
        echo "          A nova versao ja esta em producao       "
        echo "--------------------------------------------------"

elif [ $versao -eq "0" ]; then
        rm /etc/nginx/sites-enabled/homologacao.conf
        ln -s /etc/nginx/sites-available/producao.conf /etc/nginx/sites-enabled/producao.conf
        service nginx reload
sleep 1
clear
        echo "--------------------------------------------------"
        echo "          Voce voltou para versao anterior        "
        echo "--------------------------------------------------"

fi
