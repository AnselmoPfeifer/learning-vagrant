#Vagrant-Puppet 
- vagrant init
- vagrant up
- vagrant provision
- vagrant provision --provision=aws
- vagrant provision --provision-with puppet
- vagrant plugin install vagrant-aws


- sudo puppet apply /vagrant/manifests/default.pp
- sudo puppet apply --test