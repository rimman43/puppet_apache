# @summary
#   Install the base Apache package
#
class puppet_apache::config {
  file { 'apache_config':
#  file { '/etc/httpd/conf/httpd.conf':
    ensure  => $puppet_apache::config_ensure,
    path    => $puppet_apache::config_path,
    source  => "puppet:///modules/puppet_apache/${osfamily}.conf",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
