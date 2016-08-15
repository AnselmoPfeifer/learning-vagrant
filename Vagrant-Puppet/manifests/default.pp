exec { 'apt-update':
  command => '/usr/bin/apt-get update'
}
package {
  ["openjdk-8-jre", "tomcat8", "mysql-server", "php", "apache2", "htop", "git"]:
    ensure => installed,
    require => Exec["apt-update"]
}

service { "tomcat8":
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package["tomcat8"]
}
exec{"download":
  command => "/usr/bin/wget -q http://github.com/alura-cursos/provisionamento-com-vagrant-e-puppet/raw/master/manifests/vraptor-musicjungle.war -O /tmp/ROOT.war"
}

file_line { 'production':
  file => "/etc/default/tomcat8",
  line => "JAVA_OPTS=\"\$JAVA_OPTS -Dbr.com.caelum.vraptor.environment=production\"",
  require => Package["tomcat8"],
  notify => Service["tomcat8"]
}
define file_line($file, $line) {
  exec { "/bin/echo '${line}' >> '${file}'":
    unless => "/bin/grep -qFx '${line}' '${file}'"
  }
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
#exec { "create_database_musicjungle":
#  command => 'mysql -uroot -e \"grant all on musicjungle.* to musicjungle@localhost identified by 'musicjungle';\",
#  path => "/usr/bin",
#  require => Service["mysql"]
#}

exec { 'remove_sites_enabled':
  command => '/bin/rm -rf /etc/apache2/sites-enabled/000* /etc/apache2/sites-available/000*'
}
file { '/etc/apache2/sites-available/default.conf':
  source => '/vagrant/manifests/default.conf',
}
file { '/etc/apache2/sites-enabled/default.conf':
  ensure => 'link',
  target => '/etc/apache2/sites-available/default.conf',
}
file { '/etc/apache2/mods-enabled/proxy.load':
  ensure => 'link',
  target => '/etc/apache2/mods-available/proxy.load',
}
file { '/etc/apache2/mods-enabled/proxy_http.load':
  ensure => 'link',
  target => '/etc/apache2/mods-available/proxy_http.load',
  notify => Service["apache2"],
  require => Package["apache2"],
}
service { 'apache2':
  ensure => running,
  enable => true,
  hasstatus => true,
  hasrestart => true,
  require => Package['apache2']
}
package { 'libapache2-mod-php':
  require => Exec['apt-update'],
  ensure => installed,
}
file { '/var/www/html/info.php':
  ensure => file,
  content => '<?php  phpinfo(); ?>',
  require => Package['apache2'],
}

exec { 'remove_app':
  #command => '/bin/cp /tmp/ROOT.war /var/lib/tomcat8/webapps/ROOT.war'
  command => '/bin/cp /vagrant/manifests/ROOT.war /var/lib/tomcat8/webapps/ROOT.war'
}

#file { "/var/lib/tomcat8/webapps/ROOT.war":
#  source => "/tmp/ROOT.war",
#  ensure => file,
#  owner => "tomcat8",
#  group => "tomcat8",
#  require => Package["tomcat8"],
#  notify => Service["tomcat8"]
#}