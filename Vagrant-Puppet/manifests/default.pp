exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}
package {
    ["openjdk-8-jre","tomcat8"]:
        ensure => installed,
        require => Exec["apt-update"]
}

package { 'apache2':
  require => Exec['apt-update'],
  ensure => installed,
}
service { 'apache2':
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package['apache2']
}
exec { 'remove_sites_enabled':
  command => '/bin/rm -fr /etc/apache2/sites-enabled/000*'
}
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',
  require => Package['apache2'],
}
file { '/etc/apache2/sites-available/default.conf':
  source => '/vagrant/manifests/default.conf',
}
exec { 'link_sites':
  command => '/bin/ln -s /etc/apache2/sites-available/default.conf /etc/apache2/sites-enabled/default.conf',
  notify => Service["apache2"],
}

package { 'mysql-server':
  require => Exec['apt-update'],
  ensure => installed,
}
service { "mysql":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["mysql-server"]
}
exec { "create_database_musicjungle":
    command => "mysqladmin -uroot create musicjungle",
    unless => "mysql -u root musicjungle",
    path => "/usr/bin",
    require => Service["mysql"]
}

#package { 'php':
#  require => Exec['apt-update'],
#  ensure => installed,
#}
#package { 'libapache2-mod-php':
#  require => Exec['apt-update'],
#  ensure => installed,
#}

service { "tomcat8":
    ensure => running,
    enable => true,
    hasstatus => true,
    hasrestart => true,
    require => Package["tomcat8"]
}
exec{"download":
    command => "/usr/bin/wget -q http://github.com/alura-cursos/provisionamento-com-vagrant-e-puppet/raw/master/manifests/vraptor-musicjungle.war -O /vagrant/manifests/ROOT.war"
}
file { "/var/lib/tomcat8/webapps/ROOT.war":
    source => "/vagrant/manifests/ROOT.war",
    owner => "tomcat8",
    group => "tomcat8",
    mode => 0644,
    require => Package["tomcat8"],
    notify => Service["tomcat8"]
}