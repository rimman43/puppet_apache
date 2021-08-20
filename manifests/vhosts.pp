# @summary 
#   Generated virtual hosts files
#
# @example
# apache::vhosts { 'namevar':
#   port      => INT,
#   subdomain => STR,
#   admin     => STR,
#   docroot   => STR,
# }
define puppet_apache::vhosts (
  Integer   $port,
  String[1] $subdomain,
  String    $admin,
  String[1] $docroot,
) {
  file { "${docroot}":
    ensure => 'directory',
    owner  => $puppet_apache::vhosts_owner,
    group  => $puppet_apache::vhosts_group,
  }

  file { "${puppet_apache::vhosts_dir}/${subdomain}.conf":
    ensure  => 'file',
    owner   => $puppet_apache::vhosts_owner,
    group   => $puppet_apache::vhosts_group,
    mode    => '0644',
    content => epp('puppet_apache/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain, 'admin' => $admin, 'docroot' => $docroot}),
    notify  => Service["${puppet_apache::service_name}"],
  }
}

