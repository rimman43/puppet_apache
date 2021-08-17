# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::config
class puppet_apache::config {
  file { 'apache_config':
    ensure => $puppet_apache::config_ensure,
    path   => $puppet_apache::config_path,
    source => "puppet:///modules/puppet_apache/${osfamily}.conf",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
