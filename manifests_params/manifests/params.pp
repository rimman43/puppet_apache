# @summary 
#   For module variables
#   case $facts['os']['family'] OR "$::osfamily"
class apache::params {
  $install_ensure = 'present'
  case $facts['os']['family'] {
    'RedHat': {
      $install_name = 'httpd'
    }
    'Debian': {
      $install_name = 'apache2'
    }
  }
}
#$facts['os']['family']
#$::osfamily

