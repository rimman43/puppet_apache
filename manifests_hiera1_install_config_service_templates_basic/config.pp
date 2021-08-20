# @summary 
#  Apache configuration file
class puppet_apache::config {
  file { 'apache_config':
    ensure => $puppet_apache::config_ensure,
    path   => $puppet_apache::config_path,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/puppet_apache/${osfamily}.conf",
  }
#  file { 'apache_display':
  file { '/etc/httpd/conf.d/vhost.conf':
    ensure  => 'present',
#    path    => '/var/www/html/index.html',
#    path    => $puppet_apache::config_index_path,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('puppet_apache/vhosts.conf.epp'),
 }
#  file { 'apache_display':
  file { '/var/www/html/index.html':
    ensure  => 'present',
#    path    => '/var/www/html/index.html',
#    path    => $puppet_apache::config_index_path,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('puppet_apache/index.html.epp'),
 }
}
