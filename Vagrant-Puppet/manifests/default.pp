exec {
    "apt-update":
    command => "/usr/bin/apt-get update"
}

package {
    [
        "openjdk-8-jre",
        "tomcat8"
    ]:
    ensure => installed,
    require => Exec["apt-update"]
}