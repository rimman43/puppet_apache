# @summary
#   Install the base Apache package
#
class puppet_apache::install {
   package { "${puppet_apache::install_name}":
    ensure => "${puppet_apache::install_ensure}",
  }
}
