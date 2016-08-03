#!/bin/bash
sudo -i << EOF
	apt-get update
	apt-get -y upgrade
	apt-get -y install aptitude
    	aptitude -y install git zip maven
EOF
