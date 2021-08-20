# @summary
#  Apache install class

class puppet_apache::install {
  package { "${puppet_apache::install_name}":
  ensure => "${puppet_apache::install_ensure}",
}
}
