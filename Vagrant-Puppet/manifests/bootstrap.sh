#!/bin/sh

set -e -x

if which puppet > /dev/null ; then
	echo "Puppet is already installed"
	exit 0
	else
	export DEBIAN_FRONTEND=noninteractive
	wget -qO /tmp/puppetlabs-release-pc1-xenial.deb https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
	sudo dpkg -i /tmp/puppetlabs-release-pc1-xenial.deb
	sudo rm /tmp/puppetlabs-release-pc1-xenial.deb
	sudo apt-get update
	echo "Installing puppet"
	sudo apt-get install puppet-common puppet -y
	echo "Puppet installed!"
fi
